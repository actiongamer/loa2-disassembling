package nslm2.modules.cultivates.position
{
   import proto.PanelBaseInfo;
   import nslm2.modules.footstones.tooltipsModules.ToolTipYuanFenVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class TooltipPositionVo
   {
       
      
      public var panelBaseInfo:PanelBaseInfo;
      
      public var toolTipYuanFenVo:ToolTipYuanFenVo;
      
      public function TooltipPositionVo(param1:PanelBaseInfo)
      {
         super();
         panelBaseInfo = param1;
         toolTipYuanFenVo = ToolTipYuanFenVo.getMengYueTip(StcMgr.ins.getNpcVo(param1.baseId).node,param1.mengyue,param1);
      }
   }
}
