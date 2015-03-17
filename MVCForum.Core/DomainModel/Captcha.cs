using System;
using MVCForum.Utilities;

namespace MVCForum.Domain.DomainModel
{
    public partial class Captcha : Entity
    {
        public Captcha()
        {
            CreatedDate = DateTime.Now;
        }
        public int CaptchaId { get; set; }
        public string Filename { get; set; }
        public string Answer { get; set; }
        public DateTime CreatedDate { get; set; }
        public Nullable<bool> IsDeleted  { get; set; }
        public Nullable<DateTime> DeletedDate { get; set; }
    }
}
