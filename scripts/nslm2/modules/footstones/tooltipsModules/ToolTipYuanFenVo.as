package nslm2.modules.footstones.tooltipsModules
{
   import proto.PanelBaseInfo;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   
   public class ToolTipYuanFenVo
   {
       
      
      public var mengYueArr:Array;
      
      public function ToolTipYuanFenVo(param1:Array)
      {
         mengYueArr = [];
         super();
         mengYueArr = param1;
      }
      
      public static function getMengYueTip(param1:int, param2:Array, param3:PanelBaseInfo = null, param4:int = -1) : ToolTipYuanFenVo
      {
         var _loc5_:ToolTipYuanFenVo = new ToolTipYuanFenVo([]);
         _loc5_.mengYueArr = MengYuePropVo.idArrToVoArr(param1,param2,param3,param4);
         return _loc5_;
      }
   }
}
