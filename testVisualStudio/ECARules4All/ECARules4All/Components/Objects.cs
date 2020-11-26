using System;
using System.Collections.Generic;
using ECARules4All.RuleEngine;
using System.Reflection;

namespace ECARules4All
{
    public class Position
    {
        public float x;
        public float y;
        public float z;
    }

    public class Rotation
    {
        public float x;
        public float y;
        public float z;
    }

    public class Path
    {
        public List<Position> Points { get; internal set; }
    }

    public class Time
    {
        public string timeString;
    }

    public class Color
    {
        public string name;
        public string hexValue;
    }

    public enum POV { First, Third }

    [ECARules4All]
    public class Object : Unity.Component
    {
        public Position position;
        public Rotation rotation;
        public bool visible;
        public bool active;

        [Action(typeof(ECARules4All.Object), "moves", typeof(Position))]
        public void Moves(Position p) { }
        public void Rotates(Rotation r) { }
        public void LooksAt(Object o) { }
        public void Shows() { }
        public void Hides() { }
        public void Activates() { }
        public void Deactivates() { }

    }

    [ECARules4All]
    public class Character : Object
    {
        public float life;
        public bool playing;

        [Action(typeof(Character), "interacts with", typeof(Object))]
        public void Interacts(Object o)
        {
            
        }
        public void Jumps(Position p) { }
        public void Jumps(Path p) { }
        public void StartsAnimation(string s) { }
    }

    public class Animal : Character
    {
        public void Speaks(string s) { }
    }

    public class AquaticAnimal : Animal
    {
        public void Swims(Position p) { }
        public void Swims(Path p) { }
    }

    public class FlyingAnimal : Animal
    {
        public void Flies(Position p) { }
        public void Flies(Path p) { }
        public void Walks(Position p) { }
        public void Walks(Path p) { }
    }

    public class TerrestrialAnimal : Animal
    {
        public void Runs(Position p) { }
        public void Runs(Path p) { }
        public void Walks(Position p) { }
        public void Walks(Path p) { }
    }

    public class Creature : Animal
    {
        public void Flies(Position p) { }
        public void Flies(Path p) { }
        public void Swims(Position p) { }
        public void Swims(Path p) { }
        public void Runs(Position p) { }
        public void Runs(Path p) { }
        public void Walks(Position p) { }
        public void Walks(Path p) { }

    }

    public class Human : Animal
    {
        public void Runs(Position p) { }
        public void Runs(Path p) { }
        public void Swims(Position p) { }
        public void Swims(Path p) { }
        public void Walks(Position p) { }
        public void Walks(Path p) { }
    }

    public class Robot : Animal
    {

        public void Runs(Position p) { }
        public void Runs(Path p) { }
        public void Swims(Position p) { }
        public void Swims(Path p) { }
        public void Walks(Position p) { }
        public void Walks(Path p) { }
    }

    public class Scene : Object { }

    public class Environment : Object { }

    public class Art : Environment
    {
        public string author;
        public float price;
        public int year;
    }

    public class Building : Environment { }

    public class Exterior : Environment { }

    public class Forniture : Environment
    {
        public float price;
        public Color color;
        public float dimension;
    }

    public class Vegetation : Environment { }

    public class Terrain : Environment { }

    public class Prop : Object
    {
        public float price;
    }

    [ECARules4All]
    public class Clothing : Prop
    {
        public string brand;
        public Color color;
        public string size;
        public bool weared;

        // underscore methods are passive
        [Action(typeof(Character), "wears", typeof(Clothing))]
        public void _Wears(Character c) { }
        public void _Unwears(Character c) { }
    }

    public class Electronic : Prop
    {
        public string brand;
        public string model;
        public bool on;

        public void Turns(bool on) { }
    }

    public class Food : Prop
    {
        public float weight;
        public Time expiration;
        public string description;
        public bool eaten;

        public void _Eats(Character c) { }
    }

    public class Weapon : Prop
    {
        public float power;
    }

    public class Bullet : Weapon
    {
        public float speed;
    }

    [ECARules4All]
    public class EdgedWeapon : Weapon
    {
        [Action(typeof(EdgedWeapon), "stabs", typeof(Object))]
        public void Stabs(Object o) { }
        public void Slices(Object o) { }
    }

    public class Firearm : Weapon
    {
        public int charge;

        public void Recharges(int charge) { }
        public void Fires(Object o) { }
        public void Aims(Object o) { }
    }

    public class Shield : Weapon
    {
        public void Blocks(Weapon w) { }
    }

    public class Vehicle : Object
    {
        public float speed;

        public void Starts() { }
        public void Accelerates(float f) { }
        public void SlowsDown(float f) { }
        public void Stops() { }
    }

    public class AirVehicle : Vehicle
    {
        public void TakesOff(Position from) { }
        public void Lands(Position p) { }
    }

    public class LandVehicle : Vehicle { }

    public class SeaVehicle : Vehicle { }

    public class SpaceVehicle : Vehicle
    {
        public float oxygen;
        public float gravity;

        public void TakesOff(Position from) { }
        public void Lands(Position p) { }
    }

    public class Interaction : Object
    {

    }

    public class Camera : Interaction
    {
        public POV pov;
        public float zoomLevel;
        public bool playing;

        public void ZoomsIn(float amount) { }
        public void ZoomsOut(float amount) { }
        public void ChangesPov(POV pov) { }
    }

    public class Bounds : Interaction
    {
        public float scale;

        public void Scales(float s) { }
    }


    public class Button : Interaction
    {
        public void _Presses(Character c) { }
    }

    public class Image : Interaction
    {
        public string source;
        public float height;
        public float width;
    }

    public class Light : Interaction
    {
        public float intensity;
        public float maxIntensity;
        public Color color;
        public bool on;

        public void Turn(bool on) { }
        public void IncreasesIntensity(float amount) { }
        public void DecreasesIntensity(float amount) { }

    }

    public class Text : Interaction
    {
        public string content;
        public void ChangesContent(string content) { }
        public void Appends(string t) { }
        public void Deletes(string t) { }
    }

    public class Video : Interaction
    {
        public string source;
        public float volume;
        public float maxVolume;
        public Time duration;
        public Time currentTime;
        public bool playing;
        public bool paused;
        public bool stopped;

        public void Plays() { }
        public void Pauses() { }
        public void Stops() { }
        public void ChangesVolume(float volume) { }
        public void ChangesCurrentTime(Time currentTime) { }
    }

    public class Behaviour : Unity.Component{ }

    public class Container : Behaviour
    {
        public int capacity;
        public int objectsCount;

        public void Inserts(Object o) { }
        public void Removes(Object o) { }
        public void Empties() { }
    }

    public class Collectable : Behaviour
    {

    }

    public class Counter : Behaviour
    {
        public float count;
        public void ChangesCount(float count) { }
    }

    public class Keypad : Behaviour
    {
        public string keycode;
        public string input;

        public void Inserts(string s) { }
        public void Resets() { }
    }

    public class Particle : Behaviour
    {
        public bool on;

        public void Turns(bool on) { }
    }

    public class Placeholder : Behaviour
    {

    }

    public class Sound : Behaviour
    {
        public string source;
        public float volume;
        public float maxVolume;
        public Time duration;
        public Time currentTime;
        public bool playing;
        public bool paused;
        public bool stopped;

        public void Plays() { }
        public void Pauses() { }
        public void Stops() { }
        public void ChangesVolume(float volume) { }
        public void ChangesCurrentTime(Time currentTime) { }
    }

    public class Switch : Behaviour
    {
        public bool on;

        public void Turns(bool on) { }
    }

    public class Transition : Behaviour
    {
        public Scene reference;

        public void Teleports(Scene reference) { }
    }

    public class Lock : Behaviour
    {
        public bool locked;
        public void Opens() { }
        public void Closes() { }
    }

    [ECARules4All]
    public class Timer : Behaviour
    {
        public Time duration;
        public Time current;

        [Action(typeof(ECARules4All.Object), "changes duration", typeof(Time))]
        public void ChangeDuration(Time duration) { }
        public void ChangeCurrentTime(Time time) { }
        public void Starts() { }
        public void Stops() { }
        public void Elapses() { }
        public void Resets() { }
    }

    public class Trigger : Behaviour
    {
        public void Triggers() { }
    }

    public class Highlight : Behaviour
    {
        public Color color;
        public bool on;
    }
}

