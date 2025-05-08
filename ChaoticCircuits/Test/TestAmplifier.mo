within ChaoticCircuits.Test;
model TestAmplifier "Test OpAmp amplifier"
  extends Modelica.Icons.Example;
  parameter Real k=1 "Gain";
  parameter SI.Resistance Rout=1e3 "Output Resistor";
  parameter SI.Resistance R_in=Rout/k "Input Resistor";
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,-10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor r_in(R=R_in)
    annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  Modelica.Electrical.Analog.Basic.Resistor rOut(R=Rout)
    annotation (Placement(transformation(extent={{30,10},{10,30}})));
  Modelica.Electrical.Analog.Sources.RampVoltage v_in(
    V=40,
    duration=0.8,
    offset=-20,
    startTime=0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,0})));
  Components.IdealizedOpAmp3Pin opAmp
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
protected
  //initialization
  SI.Current i_gnd(start=0)=ground.p.i;
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
  connect(rOut.n, opAmp.in_n)
    annotation (Line(points={{10,20},{0,20},{0,6}}, color={0,0,255}));
  connect(vOut.p, rOut.p)
    annotation (Line(points={{30,0},{30,20}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>Plot v_in.v and vOut.v to check gain = 1 and saturation.</p>
</html>"));
end TestAmplifier;
