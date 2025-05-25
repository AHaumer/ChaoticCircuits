within ChaoticCircuits.RikitakeSystem;
record MachineData "Common parameters for DC machines"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;
  parameter String MachineType="BaseData";
  parameter SI.Inertia J=0.15 "Rotor's moment of inertia";
  parameter SI.Voltage VaNominal=100 "Nominal armature voltage"
    annotation (Dialog(tab="Nominal parameters"));
  parameter SI.Current IaNominal=100 "Nominal armature current"
    annotation (Dialog(tab="Nominal parameters"));
  parameter SI.AngularVelocity wNominal(displayUnit="rpm")= 1425*2*pi/60 "Nominal speed"
    annotation (Dialog(tab="Nominal parameters"));
  parameter SI.Current IeNominal=100 "Nominal excitation current"
    annotation (Dialog(tab="Nominal parameters"));
  parameter SI.Resistance R=0.05
    "Armature resistance at TaRef"
    annotation (Dialog(tab="Nominal parameters", group="Armature"));
  parameter SI.Inductance L=0.0015 "Armature inductance"
    annotation (Dialog(tab="Nominal parameters", group="Armature"));
  // Calculation of additonal parameters
  parameter SI.Voltage ViNominal=VaNominal - R*IaNominal "Nominal induce voltage"
    annotation (Dialog(tab="Nominal parameters", enable=false));
  parameter SI.MutualInductance M=ViNominal/wNominal/IeNominal "Mutual inductance"
    annotation (Dialog(tab="Nominal parameters", enable=false));
  parameter SI.Torque tauNominal=M*IeNominal*IaNominal "Nominal torque"
    annotation (Dialog(tab="Nominal parameters", enable=false));
  parameter Real mu=1 "Resistive parameter";
  parameter SI.Torque tau=J/mu^2*R^2/(L*M) "Applied torque"
    annotation (Dialog(enable=false));
  parameter SI.Time Tm=J/tau*R/M "Mechanical time constant"
    annotation (Dialog(enable=false));
  parameter SI.Time Te=L/R "Electrical time constant"
    annotation (Dialog(enable=false));
  parameter SI.Time tRef=sqrt(Tm*Te) "Reference time"
    annotation (Dialog(enable=false));
  parameter SI.Current iRef=sqrt(tau/M) "Reference current"
    annotation (Dialog(enable=false));
  parameter SI.AngularVelocity wRef(displayUnit="rpm")=sqrt(tau/J*L/M) "Reference speed"
    annotation (Dialog(enable=false));
  annotation (
    defaultComponentName="machineData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"),
    Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%MachineType")}));
end MachineData;
