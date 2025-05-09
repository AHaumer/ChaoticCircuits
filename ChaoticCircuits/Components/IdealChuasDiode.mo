within ChaoticCircuits.Components;
model IdealChuasDiode "Chua's diode"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter Real k0=15000.0 "No-load amplification of opAmps";
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter SI.Resistance R1 = 220 "NIC1: feedback resistor";
  parameter SI.Resistance R1g=2200 "NIC1: ground resistor";
  parameter SI.Resistance R2 =22e3 "NIC2: feedback resistor";
  parameter SI.Resistance R2g=3300 "NIC2: ground resistor";
  //calculated parameters
  parameter SI.Voltage VLim1=Vs*R1g/(R1g + R1) "NIC1: Left and right corner voltage"
    annotation(Dialog(tab="Results", group="NIC1"));
  parameter SI.Conductance gPos1=1/R1 "NIC1: Positive differential conductance"
    annotation(Dialog(tab="Results", group="NIC1"));
  parameter SI.Conductance gNeg1=-1/R1g "NIC1: Negative differential conductance"
    annotation(Dialog(tab="Results", group="NIC1"));
  parameter SI.Voltage VLim2=Vs*R2g/(R2g + R2) "NIC2: Left and right corner voltage"
    annotation(Dialog(tab="Results", group="NIC2"));
  parameter SI.Conductance gPos2=1/R2 "NIC2: Positive differential conductance"
    annotation(Dialog(tab="Results", group="NIC2"));
  parameter SI.Conductance gNeg2=-1/R2g "NIC2: Negative differential conductance"
    annotation(Dialog(tab="Results", group="NIC2"));
  parameter SI.Voltage Ve=min(VLim1, VLim2) "Inner limit"
    annotation(Dialog(tab="Results"));
  parameter SI.Conductance Ga=gNeg1 + gNeg2 "Inner slope"
    annotation(Dialog(tab="Results"));
  parameter SI.Conductance Gb=if VLim1<VLim2 then gPos1 + gNeg2 else gNeg1 + gPos2 "Intermedita slope"
    annotation(Dialog(tab="Results"));
  parameter SI.Voltage Vmax=max(VLim1, VLim2) "Voltage peak"
    annotation(Dialog(tab="Results"));
  parameter SI.Conductance Gc=gPos1 + gPos2 "Outer slope"
    annotation(Dialog(tab="Results"));
  IdealNIC idealNIC1(
    Vs=Vs,
    R=R1,
    Rg=R1g)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  IdealNIC idealNIC2(
    Vs=Vs,
    R=R2,
    Rg=R2g)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
equation
  connect(idealNIC1.n, n) annotation (Line(points={{10,20},{80,20},{80,0},{100,0}},
        color={0,0,255}));
  connect(n, idealNIC2.n) annotation (Line(points={{100,0},{80,0},{80,-20},{10,-20}},
        color={0,0,255}));
  connect(p, p) annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
  connect(p, idealNIC2.p) annotation (Line(points={{-100,0},{-80,0},{-80,-20},{-10,
          -20}}, color={0,0,255}));
  connect(p, idealNIC1.p) annotation (Line(points={{-100,0},{-80,0},{-80,20},{-10,
          20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-170,110},{150,70}},
          textColor={0,0,255},
          textString="%name"),
        Line(points={{-80,-20},{-60,40},{-8,10},{8,-10},{60,-40},{80,20}},
            color={28,108,200})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-100,100},{100,70}},
          textString="%name",
          textColor={0,0,255})}),
    Documentation(info="<html>
<p>This is the only nonlinear component for Chua&#39;s circuit. It is a piecewise linear resistor with both an inner and an outer range, which includes the inner one. The slopes of both ranges are given by parameters. The resistance characteristic is continuous. For Chua&#39;s circuit both slopes have to be chosen to be negative.</p>
<p>This model is an extension: The peak voltage due to saturation of an implementation with 2 opAmps is taken into account. Outside peak voltage, the slope is positive.</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
</p>
</html>"));
end IdealChuasDiode;
