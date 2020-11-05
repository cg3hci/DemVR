parser grammar ECARulesParser;
options {tokenVocab=ECARulesLexer;}

// variables declaration
declaration:
    objectDeclaration | positionDeclaration | pathDeclaration | colorDeclaration;

objectDeclaration :
    DEFINE type IDENTIFIER SEMI;

positionDeclaration :
    DEFINE POSITION IDENTIFIER EQUAL positionLiteral SEMI;

positionLiteral :
    LPAREN floatLiteral COMMA
    floatLiteral  COMMA
    floatLiteral RPAREN;

pathDeclaration :
    DEFINE PATH IDENTIFIER EQUAL LBRACE positionLiteral (COMMA positionLiteral)? RBRACE SEMI;

colorDeclaration :
    DEFINE COLOR IDENTIFIER EQUAL COLOR_LITERAL SEMI;

floatLiteral :
    FLOAT_LITERAL | DECIMAL_LITERAL;

// variable references
reference:
    THE object IDENTIFIER;
type:
    object | behaviour;
object:
    character | scene | environment | prop | vehicle | interaction;
character:
    animal | CREATURE | HUMAN | ROBOT;
animal:
    AQUATIC | FLYING | TERRESTRIAL;
scene:
    SCENE;
environment:
    ART | BUILDING | EXTERIOR | FURNITURE | SKY | VEGETATION | TERRAIN;
prop:
    CLOTHING | ELECTRONIC | FOOD | weapon;
weapon:
    BULLET | EDGED | FIREARM | SHIELD;
vehicle:
    AIRVEHICLE | LANDVEHICLE | SEAVEHICLE | SPACEVEHICLE;
interaction:
    BOUNDS | BUTTON | CAMERA | IMAGE | LIGHT | TEXT | VIDEO;
behaviour:
    CONTAINER | COLLECTABLE | COUNTER | HIGHLIGHT | KEYPAD | LOCK |
    PARTICLE | PLACEHOLDER | SOUND | SWITCH | TRANSITION | TRIGGER | TIMER;

// complex types
position:
    THE POSITION IDENTIFIER;
path:
    THE PATH IDENTIFIER;
angle:
    floatLiteral DEGREES (AROUND (X|Y|Z) AXIS)?;
color:
    THE COLOR IDENTIFIER;



// type alias
alias:
    DEFINE type AS STRING_LITERAL FOR IDENTIFIER SEMI;

rule :
    WHEN action (IF condition)? THEN (action)* ;

action :
    aquaticAction | flyingAction | terrestrialAction |
    creatureAction | humanAction | robotAction |
    sceneAction |
    artAction | buildingAction | exteriorAction | furnitureAction |
    skyAction | vegetationAction | terrainAction |
    clothingAction | electronicAction | foodAction |
    bulletAction | edgedAction | firearmAction | shieldAction
    airVehicleAction | landVehicleAction | seaVehicleAction | spaceVehicleAction
    boundsAction | buttonAction | cameraAction | imageAction |
    lightAction | textAction | videoAction |
    containerAction | collectableAction | counterAction | highlightAction
    keypadAction | lockAction | particleAction | soundAction | placeholderAction
    switchAction | transitionAction | triggerAction | timerAction
    SEMI;

// actions for each type
objectAction:
    moves | rotates | looksAt;

// character actions
characterAction:
    objectAction | jumps | interacts | setLife | setPlaying | startsAnimation;

animalAction:
    characterAction | speaks;

aquaticAction :
    THE AQUATIC IDENTIFIER (animalAction | swims);

flyingAction :
    THE FLYING IDENTIFIER (animalAction | flies);

terrestrialAction:
    THE TERRESTRIAL IDENTIFIER (animalAction | runs | walks);

creatureAction:
    THE CREATURE IDENTIFIER (animalAction | walks | swims | runs | flies);

humanAction:
    THE HUMAN IDENTIFIER (animalAction | walks | runs | swims);

robotAction:
    THE ROBOT IDENTIFIER (animalAction | walks | runs | swims);

// scene actions
sceneAction:
    objectAction;

// environment  actions
environmentAction:
    objectAction;

artAction:
    THE ART IDENTIFIER (environmentAction | setAuthor | setPrice | setYear);

buildingAction:
    THE BUILDING IDENTIFIER (environmentAction);

exteriorAction:
    THE EXTERIOR IDENTIFIER (environmentAction);

furnitureAction:
    THE FURNITURE IDENTIFIER (environmentAction | setPrice | setColor | setDimension);

skyAction:
    THE SKY IDENTIFIER (environmentAction);

vegetationAction:
    THE VEGETATION IDENTIFIER (environmentAction);

terrainAction:
    THE TERRAIN IDENTIFIER (environmentAction);

clothingAction :
    (THE CLOTHING IDENTIFIER (environmentAction | setBrand | setSize | setColor )) |
    wears;

electronicAction :
    THE ELECTRONIC IDENTIFIER (environmentAction | setBrand | setModel | turns);

foodAction:
    (THE FOOD (setWeight | setExpiration | setDescription)) |
    eats;

weaponAction:
    environmentAction | setPower;

bulletAction:
    THE BULLET IDENTIFIER (weaponAction | setSpeed);

edgedAction:
    THE EDGED IDENTIFIER (weaponAction | stabs | slices);

firearmAction:
    THE FIREARM IDENTIFIER (weaponAction | recharges | fires | aims);

shieldAction:
    THE SHIELD IDENTIFIER (weaponAction | blocks);

// vehicle actions
vehicleAction:
    objectAction |
    setSpeed | starts | stops | accelerates | slowsDown;

airVehicleAction:
    THE AIRVEHICLE IDENTIFIER (vehicleAction | takesOff | lands);

landVehicleAction:
    THE LANDVEHICLE IDENTIFIER (vehicleAction);

seaVehicleAction:
    THE SEAVEHICLE IDENTIFIER (vehicleAction);

spaceVehicleAction:
    THE SPACEVEHICLE IDENTIFIER (vehicleAction | takesOff | lands | setGravity | setOxygen);

// interaction actions
interactionActions:
    objectAction;

boundsAction:
    (THE character IDENTIFIER (userRotates | userScales | userMoves) )|
    (THE BOUNDS IDENTIFIER (interactionActions ));

buttonAction:
    (THE character IDENTIFIER (userPushes) ) |
    (THE BUTTON IDENTIFIER (objectAction));

cameraAction:
    THE CAMERA IDENTIFIER (interactionActions | setPointOfView | setZoom | zoomsIn | zoomsOut | setPlaying);

imageAction:
    THE IMAGE IDENTIFIER (interactionActions | setSource | setHeight| setWidth);

lightAction:
    THE LIGHT IDENTIFIER (interactionActions | turns | setIntensity | setMaxIntensity | setColor );

textAction:
    THE TEXT IDENTIFIER (interactionActions | setContent | appends | deletes );

videoAction:
    THE VIDEO IDENTIFIER (interactionActions | plays | pauses
    | stops | setSource | setVolume | setCurrentTime);

// behaviour actions
containerAction:
    contains | removes | empties | THE object IDENTIFIER setCapacity;

collectableAction:
    collects;

counterAction:
    THE object IDENTIFIER setCount;

highlightAction:
    THE object IDENTIFIER (setHighlight | setHighlightColor);

keypadAction:
    THE object IDENTIFIER (inserts | resets | setKeyCode);

lockAction:
    THE object IDENTIFIER (opens | closes | setLocked);

particleAction:
    THE object IDENTIFIER turns;

soundAction:
    THE object IDENTIFIER
        (setSoundSource | setSoundVolume | setSoundMaxVolume | setSoundCurrentTime
         playSound |pauseSound | stopSound  );

placeholderAction:
    ;

switchAction:
    THE object IDENTIFIER (turns );

transitionAction:
    THE character IDENTIFIER teleports |
    THE object IDENTIFIER (setTargetScene);

triggerAction:
    THE object IDENTIFIER (triggers);

timerAction:
    THE object IDENTIFIER (setTimer | startTimer | stopTimer | pauseTimer | elapseTimer);

// verb list
accelerates:
    ACCELERATES (BY floatLiteral);

aims:
    AIMS reference;

appends:
    APPENDS STRING_LITERAL;

blocks:
    BLOCKS THE weapon IDENTIFIER;

closes:
    CLOSES;

deletes:
    DELETES;

elapseTimer:
    TIMERELAPSE;

fires:
    FIRES reference;

flies:
    FLIES ((TO position) | (ON path));

interacts:
    INTERACTS WITH reference;

inserts:
    INSERTS STRING_LITERAL;

jumps:
    JUMPS ((TO position) | (ON path))? ;

lands:
    LANDS (IN position)?;

looksAt:
    LOOKS AT reference;

moves:
    MOVES ((TO position) | (ON path));

opens:
    OPENS;

pauses:
    PAUSES;

pauseSound:
    SOUNDPAUSE;

pauseTimer:
    TIMERPAUSE;

plays:
    PLAYS;

playSound:
    SOUNDPLAY;

recharges:
    RECHARGES (BY DECIMAL_LITERAL)?;

resets:
    RESETS;

rotates:
    ROTATES OF angle;

runs:
    RUNS ((TO position) | (ON path));

slices:
    SLICES reference;

slowsDown:
    SLOWS (BY floatLiteral)?;

speaks:
    SPEAKS STRING_LITERAL;

stabs:
    STABS reference;

startsAnimation:
    STARTSANIMATION STRING_LITERAL;

starts:
    STARTS;

startTimer:
    TIMERSTART;

stops:
    STOPS;

stopSound:
    SOUNDSTOP;

stopTimer:
    TIMERSTOP;

swims :
    SWIMS ((TO position) | (ON path));

teleports:
    TELEPORTS TO SCENE IDENTIFIER;

takesOff:
    TAKESOFF (FROM position)?;

triggers:
    TRIGGERS;

turns:
    TURNS (ON | OFF);

walks:
    WALKS ((TO position) | (ON path));

zoomsIn:
    ZOOMSIN;
zoomsOut:
    ZOOMSOUT;

// setters
setAuthor:
    CHANGES AUTHOR TO STRING_LITERAL;

setBrand:
    CHANGES BRAND TO STRING_LITERAL;

setCapacity:
    (INCREASES | DECREASES) CAPACITY (BY DECIMAL_LITERAL)? |
    CHANGES CAPACITY TO DECIMAL_LITERAL;

setColor:
    CHANGES COLOR TO (color | COLOR_LITERAL);

setContent:
    CHANGES CONTENT TO STRING_LITERAL;

setCount:
    (INCREASES | DECREASES) COUNT (BY DECIMAL_LITERAL)? |
        CHANGES COUNT TO DECIMAL_LITERAL;

setCurrentTime:
    CHANGES CURRENTTIME TO TIME_LITERAL;

setDescription:
    CHANGES DESCRIPTION TO STRING_LITERAL;

setDimension:
    (INCREASES | DECREASES) DIMENSION (BY floatLiteral)? |
    CHANGES DIMENSION TO floatLiteral;

setHighlight:
    SWITCHES HIGHLIGHT TO (ON | OFF);

setHighlightColor:
    CHANGES HIGHLIGHTCOLOR TO color;

setKeyCode:
    CHANGES KEYCODE TO STRING_LITERAL;

setLocked:
    CHANGES LOCKED TO BOOL_LITERAL;

setExpiration:
    EXPIRES IN TIME_LITERAL;

setGravity:
    (INCREASES | DECREASES) GRAVITY (BY floatLiteral)? |
    CHANGES GRAVITY TO floatLiteral;

setHeight:
     (INCREASES | DECREASES) HEIGHT (BY floatLiteral PX)? |
     CHANGES HEIGHT TO floatLiteral PX;

setIntensity:
    (INCREASES | DECREASES) INTENSITY (BY floatLiteral)? |
     CHANGES INTENSITY TO floatLiteral;

setLife:
    (INCREASES | DECREASES) LIFE (BY floatLiteral)? |
    CHANGES LIFE TO floatLiteral;

setMaxIntensity:
    (INCREASES | DECREASES) MAXINTENSITY (BY floatLiteral)? |
     CHANGES MAXINTENSITY TO floatLiteral;

setModel:
    CHANGES MODEL TO STRING_LITERAL;

setOxygen:
    (INCREASES | DECREASES) OXYGEN (BY floatLiteral)? |
    CHANGES OXYGEN TO floatLiteral;

setSize:
    CHANGES SIZE TO STRING_LITERAL;

setSource:
    CHANGES SOURCE TO STRING_LITERAL;

setPlaying:
    CHANGES PLAYING TO BOOL_YES_NO;

setPower:
    (INCREASES | DECREASES) POWER (BY floatLiteral)? |
    CHANGES POWER TO floatLiteral;

setPrice:
    (INCREASES | DECREASES) PRICE (BY floatLiteral)? |
    CHANGES PRICE TO floatLiteral;

setPointOfView:
    CHANGES POV TO POV_LITERAL;

setSpeed:
    (INCREASES | DECREASES) SPEED (BY floatLiteral KMH)? |
    CHANGES SPEED TO floatLiteral KMH;

setSoundSource:
    CHANGES SOUNDSOURCE TO STRING_LITERAL;

setSoundVolume:
    (INCREASES | DECREASES) SOUNDVOLUME (BY floatLiteral)? |
        CHANGES SOUNDVOLUME TO floatLiteral;

setSoundMaxVolume:
    (INCREASES | DECREASES) SOUNDMAXVOLUME (BY floatLiteral)? |
        CHANGES SOUNDMAXVOLUME TO floatLiteral;

setSoundCurrentTime:
    CHANGES SOUNDCURRENTTIME TO TIME_LITERAL;

setTargetScene:
    CHANGES TARGET TO THE SCENE IDENTIFIER;

setTimer:
    CHANGES TIMER TO TIME_LITERAL;

setVolume:
    (INCREASES | DECREASES) VOLUME (BY floatLiteral)? |
        CHANGES VOLUME TO floatLiteral;

setWidth:
    (INCREASES | DECREASES) WIDTH (BY floatLiteral PX)? |
    CHANGES WIDTH TO floatLiteral PX;

setWeight:
    (INCREASES | DECREASES) WEIGHT (BY floatLiteral KILOS)? |
    CHANGES WEIGHT TO floatLiteral KILOS;

setYear:
    (INCREASES | DECREASES) YEAR (BY floatLiteral)? |
    CHANGES YEAR TO floatLiteral;

setZoom:
    (INCREASES | DECREASES) ZOOM (BY floatLiteral)? |
    CHANGES ZOOM TO floatLiteral;

// passive actions
collects:
    THE character IDENTIFIER COLLECTS reference;

contains:
    THE object IDENTIFIER CONTAINS reference;

removes:
    THE object IDENTIFIER REMOVES reference;

empties:
    THE object IDENTIFIER EMPTIES;

eats:
    THE character IDENTIFIER EATS THE FOOD IDENTIFIER;

wears:
    THE character IDENTIFIER WEARS THE CLOTHING IDENTIFIER;

userMoves:
    MOVES THE  ((TO position| ON path))?;

userPushes:
    PUSHES THE BUTTON IDENTIFIER;

userRotates:
    ROTATES THE BOUNDS IDENTIFIER (OF angle)?;

userScales:
    SCALES THE BOUNDS IDENTIFIER (TO floatLiteral);



condition : AND;
complement: OR;


