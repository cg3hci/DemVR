using System;
using System.Collections.Generic;
using System.Reflection;
using Unity;

namespace ECARules4All.RuleEngine
{
    public class RuleEngine
    {
        public static RuleEngine singleton;

        public static RuleEngine GetInstance()
        {
            if(singleton == null)
            {
                singleton = new RuleEngine();
            }

            return singleton;
        }

        private RuleEngine()
        {
            
        }

        public Dictionary<GameObject, ECARuleInfo> CreateDescriptors(GameObject[] objects)
        {
            Dictionary<GameObject, ECARuleInfo> ecaDescriptors = new Dictionary<GameObject, ECARuleInfo>();

            foreach(GameObject obj in objects)
            {
                ECARuleInfo info = new ECARuleInfo();
                info.EcaRuleType = typeof(System.Object);
                ecaDescriptors.Add(obj, info);
                foreach(Component c in obj.GetComponents())
                {
                    Type cType = c.GetType();
                    if(Attribute.IsDefined(cType, typeof(ECARules4AllAttribute)))
                    {
                        // we found a ECARules4All managed type
                        if (cType.IsSubclassOf(typeof(ECARules4All.Object)))
                        {
                            // find the minimum type associated with the different components
                            if (cType.IsSubclassOf(info.EcaRuleType))
                            {
                                info.EcaRuleType = cType;
                            }
                            
                        }

                        // add the actions to the list
                        foreach (MethodInfo m in cType.GetMethods())
                        {
                            ActionAttribute[] actions = (ActionAttribute[])m.GetCustomAttributes(typeof(ActionAttribute), true);
                            foreach (ActionAttribute a in actions)
                            {
                                info.Actions.Add(a);
                            }
                        }
                    }
                }
            }

            return ecaDescriptors;
        }

        public List<String> ListActions(Component c)
        {
            return this.ListActions(c.GetType());
        }

        public List<String> ListActions(Type c)
        {
            List<String> actions = new List<String>();
            foreach(MethodInfo m in c.GetMethods())
            {
                object[] a = m.GetCustomAttributes(typeof(ActionAttribute), true);
                if(a.Length > 0 )
                    actions.Add(a[0].ToString());
            }

            return actions;
        }

        public List<String> BuildEventList()
        {
            List<String> actions = new List<String>();
            foreach (Assembly ass in AppDomain.CurrentDomain.GetAssemblies())
            {
                foreach (Type t in ass.GetExportedTypes())
                { 
                    if (t.IsSubclassOf(typeof(Unity.Component)) && Attribute.IsDefined(t, typeof(ECARules4AllAttribute)))
                    {
                        actions.AddRange(this.ListActions(t));
                    }
                }
            }

            return actions;
        }


        public void ActionPerformed(Object s, string verb, Object o)
        {
             
        }

        
    }

    public class Rule
    {
        
    }

    public class Action
    {

    }
}
