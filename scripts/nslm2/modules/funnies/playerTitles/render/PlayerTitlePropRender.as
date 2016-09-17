package nslm2.modules.funnies.playerTitles.render
{
   import game.ui.playerTitle.render.PlayerTitlePropRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   
   public class PlayerTitlePropRender extends PlayerTitlePropRenderUI
   {
       
      
      public function PlayerTitlePropRender()
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
            this.label_prop.text = NPCPropConsts.ins.getLocaleName(vo.propId) + "：";
            NpcPropVo.setLabelColor(label_value,vo);
            this.label_value.text = "+" + int(vo.value);
         }
      }
   }
}
