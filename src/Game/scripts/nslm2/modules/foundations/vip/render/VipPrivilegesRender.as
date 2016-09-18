package nslm2.modules.foundations.vip.render
{
   import game.ui.vipModule.render.VipPrivilegesRenderUI;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.vo.VipVo;
   
   public class VipPrivilegesRender extends VipPrivilegesRenderUI
   {
       
      
      private var model:VipModel;
      
      public function VipPrivilegesRender()
      {
         model = VipModel.ins;
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:Array = model.getVipValueArr(param1 as VipVo);
         this.func_list.repeatY = _loc2_.length;
         this.height = func_list.height;
         this.func_list.dataSource = _loc2_;
      }
   }
}
