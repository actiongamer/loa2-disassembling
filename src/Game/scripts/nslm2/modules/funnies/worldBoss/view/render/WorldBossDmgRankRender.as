package nslm2.modules.funnies.worldBoss.view.render
{
   import game.ui.worldBoss.render.WorldBossDmgRankRenderUI;
   import proto.WorldBossRankData;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   
   public class WorldBossDmgRankRender extends WorldBossDmgRankRenderUI
   {
       
      
      private var _data:WorldBossRankData;
      
      public function WorldBossDmgRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as WorldBossRankData;
         img_rank.visible = false;
         txt_rank.text = "";
         if(_data)
         {
            switch(int(_data.rank) - 1)
            {
               case 0:
                  img_rank.visible = true;
                  this.txt_rank.visible = false;
                  img_rank.skin = "png.a5.commonImgs.1ST";
                  changeTextColor(16542720);
                  break;
               case 1:
                  img_rank.visible = true;
                  this.txt_rank.visible = false;
                  img_rank.skin = "png.a5.commonImgs.2ND";
                  changeTextColor(12798193);
                  break;
               case 2:
                  img_rank.visible = true;
                  this.txt_rank.visible = false;
                  img_rank.skin = "png.a5.commonImgs.3RD";
                  changeTextColor(4827135);
            }
            txt_name.text = LinkUtils.playerNameSmart(_data.playerid,_data.name,0);
            txt_value.num = _data.hurt;
         }
      }
      
      private function changeTextColor(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = this.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.getChildAt(_loc5_);
            if(_loc3_ is Label)
            {
               (_loc3_ as Label).color = param1;
            }
            _loc5_++;
         }
      }
   }
}
