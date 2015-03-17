using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using MVCForum.Domain.Constants;
using MVCForum.Domain.Interfaces.Services;
using MVCForum.Domain.Interfaces.UnitOfWork;
using MVCForum.Website.ViewModels;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Website.Controllers
{
    [RoutePrefix("Captcha")]
    public partial class CaptchaController : BaseController
    {
        private readonly ICaptchaService _captchaService;

        public CaptchaController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService, ICaptchaService captchaService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _captchaService = captchaService;
        }


        [HttpGet]
        [AllowAnonymous]
        [Route("SHOW-IMAGE/{guid}")]
        public FileContentResult GetImage(string guid)
        {
            try
            {
                string filename;
                string answer;

                if (HttpRuntime.Cache[guid] != null)
                {
                    Dictionary<string, string> cachecontent = HttpRuntime.Cache[guid] as Dictionary<string, string>;
                    filename = cachecontent["Filename"];
                    answer = cachecontent["Answer"];

                    HttpRuntime.Cache.Remove("guid");
                    HttpRuntime.Cache.Add(guid, cachecontent, null, DateTime.Now.AddMinutes(30), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.High, null);
                }
                else
                {
                    Captcha captcha = _captchaService.GetRandom();
                    Dictionary<string, string> cachecontent = new Dictionary<string, string>();
                    cachecontent.Add("Filename", captcha.Filename);
                    cachecontent.Add("Answer", captcha.Answer);
                    filename = captcha.Filename;
                    answer = captcha.Answer;
                    HttpRuntime.Cache.Add(guid, cachecontent, null, DateTime.Now.AddMinutes(30), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.High, null);
                }

                byte[] data;
                string basedpath = Server.MapPath("/Content/Images/Captcha/");
                string displayfilename = "SecurityQuestion.gif";
                FileStream stream = new FileStream(basedpath + @"\" + filename, FileMode.Open, FileAccess.Read);
                data = new byte[stream.Length];
                stream.Read(data, 0, data.Length);
                string mimeType = "image/gif";
                Response.AppendHeader("Content-Disposition", "inline; filename=" + displayfilename);
                stream.Close();
                return File(data, mimeType);
            }
            catch (Exception ex)
            {
                string test = ex.GetBaseException().ToString();
            
            }
            return null;
        }

    }
}
