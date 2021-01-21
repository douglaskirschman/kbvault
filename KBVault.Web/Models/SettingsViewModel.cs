using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using KBVault.Dal.Entities;
using Resources;

namespace KBVault.Web.Models
{
    public class SettingsViewModel
    {
        public SettingsViewModel()
        {
            Themes = new List<string>();
        }

        public SettingsViewModel(Settings set)
        {
            if (set != null)
            {
                this.CompanyName = set.CompanyName;
                this.ArticleCountPerCategoryOnHomePage = set.ArticleCountPerCategoryOnHomePage;
                this.JumbotronText = set.JumbotronText;
                this.TagLine = set.TagLine;
                this.IndexFileExtensions = set.IndexFileExtensions;
                this.BackupPath = set.BackupPath;
                this.ShowTotalArticleCountOnFrontPage = set.ShowTotalArticleCountOnFrontPage;
                Themes = new List<string>();
            }
        }

        [Required(ErrorMessageResourceType = typeof(UIResources), ErrorMessageResourceName = "SettingsCompanyNameRequiredMessage")]
        public string CompanyName { get; set; }

        public string TagLine { get; set; }

        public string JumbotronText { get; set; }

        [RegularExpression(@"^\d+$", ErrorMessageResourceType=typeof(UIResources), ErrorMessageResourceName="SettingsPageArticleCountNumericErrorMessage")]
        public short ArticleCountPerCategoryOnHomePage { get; set; }

        public string IndexFileExtensions { get; set; }

        public string BackupPath { get; set; }

        public bool ShowTotalArticleCountOnFrontPage { get; set; }

        public string SelectedTheme { get; set; }

        public List<string> Themes { get; set; }

        public string ApplicationVersion { get; set; }
    }
}