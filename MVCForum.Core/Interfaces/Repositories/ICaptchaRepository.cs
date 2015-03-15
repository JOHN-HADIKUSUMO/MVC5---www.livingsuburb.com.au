using System.Collections.Generic;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Domain.Interfaces.Repositories
{
    public partial interface ICaptchaRepository
    {
        Captcha Read(int id);
        Captcha Add(Captcha captcha);
        void Delete(Captcha captcha);
        List<Captcha> GetAll(int amountToTake);
        int Count();
    }
}
