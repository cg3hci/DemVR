using System;
namespace ECARules4All.RuleEngine
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = false)]
    public class ECARules4AllAttribute : System.Attribute
    {
        public ECARules4AllAttribute()
        {
        }
    }
}
