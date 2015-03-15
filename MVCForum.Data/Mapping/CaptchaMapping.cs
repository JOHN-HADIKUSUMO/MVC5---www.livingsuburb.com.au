using System.Data.Entity.ModelConfiguration;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Data.Mapping
{
    public class CaptchaMapping : EntityTypeConfiguration<Captcha>
    {
        public CaptchaMapping()
        {
            HasKey(x => x.CaptchaId);
        }
    }
}
