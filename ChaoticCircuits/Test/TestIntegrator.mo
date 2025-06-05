within ChaoticCircuits.Test;
model TestIntegrator "Test OpAmp integrator"
  extends Modelica.Icons.Example;
  parameter SI.Time Tau=10e-3 "Integral time constant";
  parameter Real k=1 "Gain";
  parameter SI.Capacitance Cout=1e-6 "Output Capacitor";
  parameter SI.Resistance R_in=Tau/Cout/k "Input Resistor";
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,-10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor r_in(R=R_in)
    annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor cOut(v(fixed=true), C=Cout)
    annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Modelica.Electrical.Analog.Sources.PulseVoltage v_in(
    V=10,
    width=50,
    period=0.1,
    offset=-5,
    startTime=-0.025) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,0})));
  Components.ImprovedOpAmp3Pin opAmp
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
equation
  connect(ground.p, vOut.n)
    annotation (Line(points={{0,-20},{30,-20}}, color={0,0,255}));
  connect(r_in.p, v_in.p)
    annotation (Line(points={{-30,20},{-30,10}}, color={0,0,255}));
  connect(ground.p, v_in.n)
    annotation (Line(points={{0,-20},{-30,-20},{-30,-10}}, color={0,0,255}));
  connect(opAmp.in_p, ground.p)
    annotation (Line(points={{0,-6},{0,-20}}, color={0,0,255}));
  connect(opAmp.out, vOut.p)
    annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
  connect(r_in.n, opAmp.in_n)
    annotation (Line(points={{-10,20},{0,20},{0,6}}, color={0,0,255}));
  connect(cOut.n, opAmp.in_n)
    annotation (Line(points={{10,20},{0,20},{0,6}}, color={0,0,255}));
  connect(vOut.p, cOut.p)
    annotation (Line(points={{30,0},{30,20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1.0,
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>
Plot v_in.v and vOut.v to check time constant Tau = R*C:<br>
Measure time distance and peak value of two consecutive peaks. 
&Delta;V / &Delta;t = Vin / Tau
</p>
</html>"));
end TestIntegrator;
