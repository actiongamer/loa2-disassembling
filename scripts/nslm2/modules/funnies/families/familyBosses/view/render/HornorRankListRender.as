package nslm2.modules.funnies.families.familyBosses.view.render
{
   import game.ui.familyBosses.render.HornorRankRenderUI;
   import proto.FamilyBossSupperRankData;
   
   public class HornorRankListRender extends HornorRankRenderUI
   {
       
      
      public function HornorRankListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:FamilyBossSupperRankData = param1 as FamilyBossSupperRankData;
         if(_loc2_)
         {
            txt_name.text = _loc2_.familyname;
            txt_count.text = _loc2_.killbosscount + "";
            switch(int(_loc2_.rank) - 1)
            {
               case 0:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.1ST";
                  break;
               case 1:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.2ND";
                  break;
               case 2:
                  img_rank.visible = true;
                  img_rank.skin = "png.a5.commonImgs.3RD";
            }
         }
         .super.dataSource = param1;
      }
   }
}
