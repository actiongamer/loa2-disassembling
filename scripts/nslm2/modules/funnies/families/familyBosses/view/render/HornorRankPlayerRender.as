package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.HornorPlayerRenderUI;
   import proto.RankMember;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   
   public class HornorRankPlayerRender extends HornorPlayerRenderUI
   {
       
      
      public function HornorRankPlayerRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         _loc2_ = _loc2_ as RankMember;
         if(_loc2_)
         {
            txt_name.text = LinkUtils.playerNameSmart(_loc2_.playerid,_loc2_.name,int(_loc2_.district));
            txt_dmg.text = _loc2_.totalhurt + "";
            txt_sname.text = "";
         }
      }
   }
}
