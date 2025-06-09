within ChaoticCircuits.Test;
model TestDynamicDiode "Test dynamic diode model"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=2,
    f=1,
    offset=-1.675)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Components.DynamicDiode diode
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
equation
  connect(ground.p, sineVoltage.n)
    annotation (Line(points={{20,-20},{10,-20}}, color={0,0,255}));
  connect(diode.n, ground.p)
    annotation (Line(points={{10,20},{20,20},{20,-20}}, color={0,0,255}));
  connect(sineVoltage.p, diode.p) annotation (Line(points={{-10,-20},{-20,-20},
          {-20,20},{-10,20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=2,
      Interval=1e-04,
      Tolerance=1e-06), Documentation(info="<html>
<p>
Test the dynamic diode model (Shockley in parallel to varying capacitance) with a sine voltage mainly negative.
</p>
<h4>Note:</h4>
<p>
For higher frequency (of the voltage source) the capacitive current component gets higher.
</p>
</html>"));
end TestDynamicDiode;
