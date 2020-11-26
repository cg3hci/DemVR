using System;
using System.Collections.Generic;
using System.Text;

namespace ECARules4All.RuleEngine
{
    [AttributeUsage(AttributeTargets.Method, Inherited = false, AllowMultiple = false)]
    public class ActionAttribute : System.Attribute
    {
        public Type SubjectType { get; set; }
        public string Verb { get; set; }
        public Type ObjectType { get; set; }

        public ActionAttribute(Type subjecType, string verb, Type objectType)
        {
            this.SubjectType = subjecType;
            this.Verb = verb;
            this.ObjectType = objectType;
        }

        public override string ToString()
        {
            return String.Format("[{0}]--[{1}]--[{2}]",
                this.SubjectType.Name, this.Verb, this.ObjectType.Name);
        }
    }

    public class ECARuleInfo
    {
        public Type EcaRuleType { get; set; }
        public List<ActionAttribute> Actions { get; internal set; }

        public ECARuleInfo()
        {
            Actions = new List<ActionAttribute>();
        }

    }
}
