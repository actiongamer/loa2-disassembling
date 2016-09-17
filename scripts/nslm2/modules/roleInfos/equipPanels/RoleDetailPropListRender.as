package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleDetailPropRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.greensock.TweenLite;
   
   public class RoleDetailPropListRender extends RoleDetailPropRenderUI
   {
       
      
      private var _showValue:Number = 0;
      
      public function RoleDetailPropListRender()
      {
         super();
      }
      
      public function get vo() : NpcPropVo
      {
         return this.dataSource as NpcPropVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId);
            this.txt_value.text = vo.value + "";
         }
      }
      
      public function get showValue() : Number
      {
         return _showValue;
      }
      
      public function set showValue(param1:Number) : void
      {
         _showValue = param1;
         this.txt_value.text = param1.toFixed();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         TweenLite.killTweensOf(this);
      }
   }
}
