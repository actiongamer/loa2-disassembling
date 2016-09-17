package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonRenderUI;
   import morn.core.components.Box;
   import morn.customs.components.ModuleViewBase;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.events.UIEvent;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   
   public class GuildDungeonRender extends GuildDungeonRenderUI
   {
       
      
      private var _dungeonArr:Array;
      
      private var _flagBox:Box;
      
      public function GuildDungeonRender()
      {
         super();
         switchEventListeners(true);
      }
      
      private function get module() : ModuleViewBase
      {
         return ModuleMgr.ins.popLayer.getModule(40720);
      }
      
      private function get vo() : StcFamilyStageChapterVo
      {
         return this.dataSource as StcFamilyStageChapterVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            clearData();
            this._dungeonArr = StcMgr.ins.getVoArrByColumnValue("static_family_stage_node","chapterid",this.vo.id);
            this._dungeonArr.sortOn("position",16);
            addFlag();
            addTreasureIcon();
         }
      }
      
      private function clearData() : void
      {
         if(_flagBox)
         {
            _flagBox.dispose();
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.img_bg.addEventListener("imageLoaded",onImageLoaded);
         }
         else
         {
            this.img_bg.removeEventListener("imageLoaded",onImageLoaded);
         }
      }
      
      private function onImageLoaded(param1:UIEvent) : void
      {
         addFlag();
         addTreasureIcon();
      }
      
      private function addFlag() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         _flagBox = new Box();
         while(_loc4_ <= _dungeonArr.length - 1)
         {
            _loc3_ = _dungeonArr[_loc4_] as StcFamilyStageNodeVo;
            switch(int(_loc3_.kind) - 1)
            {
               case 0:
                  _loc1_ = new GuildDungeonFlagRender(GuildDungeonModel.ins.getNodeInfo(_loc3_.id).state);
                  break;
               case 1:
                  _loc1_ = new GuildDungeonYukouFlagRender(!!GuildDungeonModel.ins.isAllCleared()?1:4);
            }
            _loc1_.dataSource = _loc3_;
            _loc2_ = _loc3_.position.split(",");
            _loc1_.x = _loc2_[0];
            _loc1_.y = _loc2_[1];
            _flagBox.addChild(_loc1_);
            _loc4_++;
         }
         this.addChild(_flagBox);
      }
      
      private function addTreasureIcon() : void
      {
         var _loc2_:GuildDungeonTreasureIcon = new GuildDungeonTreasureIcon();
         var _loc1_:Array = this.vo.rewardpos.split(",");
         _loc2_.x = _loc1_[0];
         _loc2_.y = _loc1_[1];
         this.addChild(_loc2_);
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
