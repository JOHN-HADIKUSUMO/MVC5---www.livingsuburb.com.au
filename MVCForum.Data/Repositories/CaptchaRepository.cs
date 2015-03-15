using System.Collections.Generic;
using System.Linq;
using MVCForum.Data.Context;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces;
using MVCForum.Domain.Interfaces.Repositories;

namespace MVCForum.Data.Repositories
{
    public partial class CaptchaRepository : ICaptchaRepository
    {
        private readonly MVCForumContext _context;
        public CaptchaRepository(IMVCForumContext context)
        {
            _context = context as MVCForumContext;
        }

        public Captcha Add(Captcha captcha)
        {
            return _context.Captcha.Add(captcha);
        }

        public void Delete(Captcha captcha)
        {
            _context.Captcha.Remove(captcha);
        }

        public List<Captcha> GetAll(int amountToTake)
        {
            return _context.Captcha.OrderBy(x => x.CreatedDate).Take(amountToTake).ToList();
        }


        public int Count()
        {
            return _context.Captcha.Count();
        }

        public Captcha Read(int id)
        {
            return _context.Captcha.Where(w => w.CaptchaId == id).FirstOrDefault();
        }
    }
}
