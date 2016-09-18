package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.GodhoodRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   
   public class GodhoodRender extends GodhoodRenderUI
   {
       
      
      private var _state:int;
      
      public function GodhoodRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.list_prop.dataSource = NpcPropVo.filterZeroProp(NpcPropVo.parseItemVo(this.wealthVo.stcItemVo));
         this.toolTip = null;
         this.img_icon.toolTip = this.wealthVo;
      }
   }
}
