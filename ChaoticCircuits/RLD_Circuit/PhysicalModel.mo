within ChaoticCircuits.RLD_Circuit;
model PhysicalModel "RLD-Circuit"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Resistance R=123 "Resistance of inductor and external";
  parameter SI.Inductance L=10e-3 "Inductor";
  parameter SI.Capacitance C=92e-12 "Fixed capacitance";
  replaceable parameter ParameterSets.DynamicDiode.D_1N4003 diodeData
    constrainedby ChaoticCircuits.ParameterSets.DynamicDiode.DynamicDiodeData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,60},{10,80}})));
  parameter SI.Capacitance Cd=diodeData.TauT*diodeData.Ids/diodeData.nVt "Diffusion capacitance at v=0";
  parameter SI.Frequency f0=1/(2*pi*sqrt(L*(C + diodeData.C0 + Cd))) "Natural frequency";
  parameter SI.Impedance Z0=sqrt(L/(C + diodeData.C0 + Cd)) "Natural impedance";
  parameter Real mu=1 "Relative amplitude of source";
  parameter Real w=1 "Relative frequency of source";
  parameter SI.Voltage V=mu*diodeData.V0 "Source amplitude";
  parameter SI.Frequency f=w*f0 "Source frequency";
  //SHortcuts to results
  SI.Voltage vS=source.v "Source voltage";
  SI.Voltage vc(start=0, fixed=true)=capacitor.v "Current at Diode and capacitor";
  SI.Current iL(start=0, fixed=true)=inductor.i "Current through inductor";
  SI.Current iD=dynamicDiode.id "Diode current";
  SI.Current iC=dynamicDiode.ic "Diode capacitive current";
  SI.ElectricCharge q=dynamicDiode.q "Diode capacitive charge";
  Modelica.Electrical.Analog.Sources.SineVoltage source(V=V, f=f) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(               L=L)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(               C=C)
    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Components.DynamicDiode dynamicDiode(data=diodeData)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
equation
  connect(source.n, ground.p)
    annotation (Line(points={{-50,-10},{-50,-20}}, color={0,0,255}));
  connect(ground.p, capacitor.n)
    annotation (Line(points={{-50,-20},{40,-20},{40,-10}}, color={0,0,255}));
  connect(ground.p, dynamicDiode.n)
    annotation (Line(points={{-50,-20},{20,-20},{20,-10}}, color={0,0,255}));
  connect(dynamicDiode.p, inductor.n)
    annotation (Line(points={{20,10},{20,20},{10,20}}, color={0,0,255}));
  connect(inductor.n, capacitor.p)
    annotation (Line(points={{10,20},{40,20},{40,10}}, color={0,0,255}));
  connect(inductor.p, resistor.n)
    annotation (Line(points={{-10,20},{-20,20}}, color={0,0,255}));
  connect(source.p, resistor.p)
    annotation (Line(points={{-50,10},{-50,20},{-40,20}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-90,-60},{90,-80}},
          textColor={28,108,200},
          textString="vary mu = 1 to 2.6 step 0.2")}),
    experiment(
      StopTime=0.002,
      Interval=1e-08,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.RLD_Circuit\">enclosing subpackage</a>.</p>
</html>"));
end PhysicalModel;
