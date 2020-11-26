using System;
using System.Collections.Generic;
using ECARules4All.RuleEngine;
using Unity;

namespace ECARules4All
{
    class Program
    {
        static void Main(string[] args)
        {
            // simulate components and game object creation
            Character c = new Character();
            Object o = new Object();
            Timer t = new Timer();

            GameObject myGameObject = new GameObject();
            myGameObject.Id = "DummyObj";
            myGameObject.AddComponent(c);
            myGameObject.AddComponent(o);
            myGameObject.AddComponent(t);

            GameObject[] objList = { myGameObject };



            RuleEngine.RuleEngine builder = RuleEngine.RuleEngine.GetInstance();

            Dictionary<GameObject, ECARuleInfo> infos = builder.CreateDescriptors(objList);

            ECARuleInfo info = infos[myGameObject];
            foreach (ActionAttribute s in info.Actions)
            {
                Console.WriteLine(s.ToString());
            }


            /*List<string> actions = builder.BuildEventList();


            Console.WriteLine("Action List");
            foreach(String s in actions)
            {
                Console.WriteLine(s);
            }*/
        }
    }
}
