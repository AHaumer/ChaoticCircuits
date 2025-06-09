within ChaoticCircuits.RLD_Circuit;
model AnalyticEquations "RLD-Circuit"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Resistance R=123 "Resistance of inductor and external";
  parameter SI.Inductance L=10e-3 "Inductor";
  parameter SI.Capacitance C=92e-12 "Fixed capacitance";
  replaceable parameter ParameterSets.DynamicDiode.DynamicDiodeData diodeData
    constrainedby ChaoticCircuits.ParameterSets.DynamicDiode.DynamicDiodeData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,60},{10,80}})));
  parameter SI.Capacitance Cd=diodeData.TauT*diodeData.Ids/diodeData.nVt "Diffusion capacitance at v=0";
  parameter SI.Frequency f0=1/(2*pi*sqrt(L*(C + diodeData.C0 + Cd))) "Natural frequency";
  parameter SI.Impedance Z0=sqrt(L/(C + diodeData.C0 + Cd)) "Natural impedance";
  parameter Real mu=1 "Relative amplitude of source";
  parameter Real w=1 "Relative frequency of source";
  parameter SI.Voltage V=mu*diodeData.V0 "Source amplitude";
  parameter SI.Frequency f=w*f0 "Source frequency";
  SI.Voltage vS=V*sin(2*pi*f*time) "Source voltage";
  SI.Voltage vc(start=0, fixed=true) "Current at Diode and capacitor";
  SI.Current iL(start=0, fixed=true) "Current through inductor";
  SI.Current iD "Diode current";
  SI.Current iC "Diode capacitive current";
  SI.ElectricCharge q "Diode capacitive charge";
  SI.Capacitance CJ "Junction capacitance";
  SI.Capacitance CD "Diffusion capacitance";
equation
  vS=R*iL + L*der(iL) + vc;
  iL = iC + iD + C*der(vc);
  iD = diodeData.Ids*(exp(vc/diodeData.nVt) - 1);
  iC = der(q);
  q = (CJ + CD)*vc;
  CJ = diodeData.C0*smooth(1, if vc<diodeData.fc*diodeData.V0 then 1/(1 - vc/diodeData.V0)^diodeData.m else
    (1 - diodeData.fc*(1 + diodeData.m) + diodeData.m*vc/diodeData.V0)/((1 - diodeData.fc)^(1 + diodeData.m)));
  CD = diodeData.TauT*diodeData.Ids/diodeData.nVt*exp(vc/diodeData.nVt);
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
end AnalyticEquations;
