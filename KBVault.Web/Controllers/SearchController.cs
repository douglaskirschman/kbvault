﻿using System;
using System.Linq;
using System.Web.Mvc;
using KBVault.Dal;
using KBVault.Dal.Entities;
using KBVault.Web.Helpers;
using KBVault.Web.Models;
using KBVault.Web.Models.Public;

namespace KBVault.Web.Controllers
{
    public class SearchController : KbVaultPublicController
    {
        [HttpPost]
        public ActionResult Do(SearchFormViewModel model)
        {
            try
            {
                if (string.IsNullOrEmpty(model.SearchKeyword))
                {
                    return RedirectToAction("Index", "Home");
                }

                if (model.CurrentPage == 0)
                {
                    model.CurrentPage++;
                }

                model.Results = KbVaultLuceneHelper.DoSearch(model.SearchKeyword, model.CurrentPage, 10);

                return View(model);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                throw;
            }
        }

        [HttpPost]
        public JsonResult More(SearchFormViewModel model)
        {
            var result = new JsonOperationResponse();
            try
            {
                model.CurrentPage++;
                model.Results = KbVaultLuceneHelper.DoSearch(model.SearchKeyword, model.CurrentPage, 1);
                result.Successful = true;
                result.Data = model;
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                result.ErrorMessage = ex.Message;
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult Ajax(string id)
        {
            var result = new JsonOperationResponse();
            try
            {
                if (Request.IsAjaxRequest())
                {
                    var items = KbVaultLuceneHelper.DoSearch(id, 1, 10);
                    result.Data = items;
                    result.Successful = true;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                result.ErrorMessage = ex.Message;
            }

            return Json(result);
        }
    }
}
