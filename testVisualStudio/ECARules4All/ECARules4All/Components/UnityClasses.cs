using System;
using System.Collections.Generic;
namespace Unity
{
    public class GameObject
    {
        private List<Component> components;
        public string Id;
        public GameObject()
        {
            components = new List<Component>();
        }

        public void AddComponent(Component c)
        {
            this.components.Add(c);
        }

        public IEnumerable<Component> GetComponents()
        {
            foreach(Component c in this.components)
            {
                yield return c;
            }
        }
    }

    public class Component
    {

    }
}
