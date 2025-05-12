within ChaoticCircuits.Test;
model TestSchmittTrigger "Test comparator with hysteresis"
  extends Modelica.Icons.Example;
  parameter Real V0=15000 "No-load amm´plification of OpAmp";
  parameter SI.Voltage Vs=15 "Supply voltage";
  parameter SI.Voltage VHys=5 "Hysteresis limit";
  parameter SI.Voltage V_in=10 "Amplitude of input voltage";
  parameter SI.Resistance R0=10e3 "Resistor at output";
  parameter SI.Resistance R=R0*VHys/Vs "Resistor at input";
  Components.IdealizedOpAmp3Pin opAmp(
    V0=V0,
    Vps=+Vs,
    Vns=-Vs,                          useSmooth=true)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor r0(R=R0)
    annotation (Placement(transformation(extent={{10,10},{-10,30}})));
  Modelica.Electrical.Analog.Basic.Resistor r(R=R)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
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
        origin={-50,0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={20,-10})));
protected
  //additional initailization
  SI.Current iOut(start=0)=opAmp.out.i;
equation
  connect(ground.p, opAmp.in_n)
    annotation (Line(points={{-20,-20},{-20,-6},{-10,-6}}, color={0,0,255}));
  connect(r.n, opAmp.in_p)
    annotation (Line(points={{-20,10},{-20,6},{-10,6}}, color={0,0,255}));
  connect(opAmp.in_p, r0.n)
    annotation (Line(points={{-10,6},{-10,20},{-10,20}}, color={0,0,255}));
  connect(opAmp.out, r0.p)
    annotation (Line(points={{10,0},{10,20}}, color={0,0,255}));
  connect(source.n, ground.p)
    annotation (Line(points={{-50,-10},{-50,-20},{-20,-20}}, color={0,0,255}));
  connect(source.p, r.p)
    annotation (Line(points={{-50,10},{-40,10}}, color={0,0,255}));
  connect(opAmp.out, voltageSensor.p)
    annotation (Line(points={{10,0},{20,0}}, color={0,0,255}));
  connect(ground.p, voltageSensor.n)
    annotation (Line(points={{-20,-20},{20,-20}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06));
end TestSchmittTrigger;
