using System.Configuration;
using System.Web.Mvc;
using KBVault.Web.Business.ApplicationSettings;
using NLog;

namespace KBVault.Web.Controllers
{
    public class KbVaultPublicController : Controller
    {
        public KbVaultPublicController()
        {
            Log = LogManager.GetCurrentClassLogger();
        }

        public Logger Log { get; set; }
        public ISettingsService SettingsService { get; set; }

        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var settings = SettingsService.GetSettings();
            if (settings != null)
            {
                ViewBag.CompanyName = settings.CompanyName;
                ViewBag.JumbotronText = settings.JumbotronText;
                ViewBag.TagLine = settings.TagLine;
                ViewBag.ArticleDisplayCount = settings.ArticleCountPerCategoryOnHomePage;
                ViewBag.Theme = ConfigurationManager.AppSettings["Theme"];
                ViewBag.ShowTotalArticleCountOnFrontPage = settings.ShowTotalArticleCountOnFrontPage;
            }
            else
            {
                ViewBag.CompanyName = "Login as admin and set your configuration parameters";
            }

            base.OnActionExecuted(filterContext);
        }
    }
}
