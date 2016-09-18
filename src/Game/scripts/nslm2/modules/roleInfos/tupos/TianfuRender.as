package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.TianfuInfoRenderUI;
   import nslm2.modules.roleInfos.vo.TianfuVo;
   
   public class TianfuRender extends TianfuInfoRenderUI
   {
       
      
      public function TianfuRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:TianfuVo = param1 as TianfuVo;
         if(_loc2_)
         {
            img_icon.disabled = !_loc2_.isActivate;
            txt_name.color = !!_loc2_.isActivate?458496:7566195;
            txt_name.text = _loc2_.des;
         }
      }
   }
}
