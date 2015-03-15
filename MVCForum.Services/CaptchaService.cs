using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.Hosting;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces.Repositories;
using MVCForum.Domain.Interfaces.Services;

namespace MVCForum.Services
{
    public partial class CaptchaService : ICaptchaService
    {
        private readonly ILoggingService _loggingService;
        private readonly ICaptchaRepository _captchaRepository;

        public CaptchaService(ILoggingService loggingService, ICaptchaRepository captchaRepository)
        {
            _loggingService = loggingService;
            _captchaRepository = captchaRepository;
        }

        public Captcha GetRandom()
        {
            int total = _captchaRepository.Count();

            Random rnd = new Random();
            int id = rnd.Next(1, total);
            return _captchaRepository.Read(id);
        }
    }
}
