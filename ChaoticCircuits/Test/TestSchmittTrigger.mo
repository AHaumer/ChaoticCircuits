within ChaoticCircuits.Test;
model TestSchmittTrigger "Test comparator with hysteresis"
  extends Modelica.Icons.Example;
  parameter Real V0=15000 "No-load amm´plification of OpAmp";
  parameter SI.Voltage Vs=15 "Supply voltage";
  parameter SI.Voltage VHys=5 "Hysteresis limit";
  parameter SI.Voltage V_in=10 "Amplitude of input voltage";
  parameter SI.Resistance Rout=10e3 "Resistor at output";
  parameter SI.Resistance R_in=Rout*VHys/Vs "Resistor at input";
  Components.IdealizedOpAmp3Pin opAmp(
    V0=V0,
    Vps=+Vs,
    Vns=-Vs,
    useSmooth=true)
    annotation (Placement(transformation(extent={{0,10},{20,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor rOut(R=Rout)
    annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Resistor r_in(R=R_in)
    annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage
                                                 source(
    V=2*V_in,
    rising=0.1,
    width=0,
    falling=0.1,
    period=0.2,
    nperiod=-1,
    offset=-V_in)                                                   annotation
    (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=270,
        origin={-30,0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,-10})));
protected
  //additional initailization
  SI.Current iOut(start=0)=opAmp.out.i;
equation
  connect(ground.p, opAmp.in_n)
    annotation (Line(points={{0,-20},{0,-6}},              color={0,0,255}));
  connect(r_in.n, opAmp.in_p)
    annotation (Line(points={{-10,20},{0,20},{0,6}},    color={0,0,255}));
  connect(opAmp.in_p, rOut.n)
    annotation (Line(points={{0,6},{0,20},{10,20}},      color={0,0,255}));
  connect(opAmp.out, rOut.p)
    annotation (Line(points={{20,0},{30,0},{30,20}},
                                              color={0,0,255}));
  connect(source.n, ground.p)
    annotation (Line(points={{-30,-10},{-30,-20},{0,-20}},   color={0,0,255}));
  connect(source.p, r_in.p)
    annotation (Line(points={{-30,10},{-30,20}}, color={0,0,255}));
  connect(opAmp.out, vOut.p)
    annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
  connect(ground.p, vOut.n)
    annotation (Line(points={{0,-20},{30,-20}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06));
end TestSchmittTrigger;
