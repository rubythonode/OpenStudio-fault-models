
# open the class to add methods to return sizing values
class OpenStudio::Model::FanVariableVolume

  # Sets all auto-sizeable fields to autosize
  def autosize
    self.autosizeMaximumFlowRate 
  end

  # Takes the values calculated by the EnergyPlus sizing routines
  # and puts them into this object model in place of the autosized fields.
  # Must have previously completed a run with sql output for this to work.
  def applySizingValues
    
    maximum_flow_rate = self.autosizedMaximumFlowRate
    #ensure that the user has not defined it
    if maximum_flow_rate.is_initialized and self.isMaximumFlowRateAutosized
      self.setMaximumFlowRate(maximum_flow_rate.get)
    end
    
  end
  
  # returns the autosized maximum flow rate as an optional double
  def autosizedMaximumFlowRate

    return self.model.getAutosizedValue(self, 'Design Size Maximum Flow Rate', 'm3/s')
    
  end

end
