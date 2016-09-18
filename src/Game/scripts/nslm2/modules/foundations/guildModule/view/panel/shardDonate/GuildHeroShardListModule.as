package nslm2.modules.foundations.guildModule.view.panel.shardDonate
{
   import game.ui.guildModules.guildShardDonate.GuildHeroShardListModuleViewUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   
   public class GuildHeroShardListModule extends GuildHeroShardListModuleViewUI
   {
       
      
      public function GuildHeroShardListModule()
      {
         super();
         this.list_items.itemRender = GuildHeroShardRender;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999004011);
         var _loc2_:Array = BagModel.ins.getHeroPiecesArrByQuality(StcMgr.ins.getDefineVo("FAMILY_DONATE_QUALITY_LIMIT").define_value.split("|"));
         _loc2_ = BagModel.ins.countWealthVoSortTempProp(_loc2_);
         _loc2_.sort(sortHeroPieceFun);
         this.list_items.dataSource = _loc2_;
         this.list_items.commitMeasure();
         this.pageBarS2.bindList(this.list_items);
         this.preShowCpl();
      }
      
      private function sortHeroPieceFun(param1:WealthVo, param2:WealthVo) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:StcItemVo = param1.stcItemVo;
         var _loc8_:StcItemVo = param2.stcItemVo;
         var _loc4_:int = param1.extraData["HERO_PIECE_STATE"];
         var _loc3_:int = param2.extraData["HERO_PIECE_STATE"];
         if(_loc4_ == 0 && _loc3_ == 0)
         {
            return sortHeroPieceFunSub(param1,param2,_loc7_,_loc8_);
         }
         _loc5_ = param1.extraData["HERO_POSITION"];
         _loc6_ = param2.extraData["HERO_POSITION"];
         if(_loc4_ == _loc3_)
         {
            if(_loc5_ < _loc6_)
            {
               return -1;
            }
            return 1;
         }
         if(_loc4_ > _loc3_)
         {
            return -1;
         }
         return 1;
      }
      
      private function sortHeroPieceFunSub(param1:WealthVo, param2:WealthVo, param3:StcItemVo, param4:StcItemVo) : int
      {
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(param3.heroPiece_stcNpcId);
         var _loc7_:StcNpcVo = StcMgr.ins.getNpcVo(param4.heroPiece_stcNpcId);
         var _loc6_:* = param1.item.count >= param3.heroPieceNeed;
         var _loc5_:* = param2.item.count >= param4.heroPieceNeed;
         if(_loc6_ && _loc5_ == false)
         {
            return -1;
         }
         if(_loc6_ == false && _loc5_)
         {
            return 1;
         }
         if(_loc8_.quality > _loc7_.quality)
         {
            return -1;
         }
         if(_loc8_.quality < _loc7_.quality)
         {
            return 1;
         }
         if(param1.item.count > param2.item.count)
         {
            return -1;
         }
         if(param1.item.count < param2.item.count)
         {
            return 1;
         }
         if(param3.id > param4.id)
         {
            return -1;
         }
         if(param3.id < param4.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get pageBarS2() : PageBarS2
      {
         return this.pageBar as PageBarS2;
      }
   }
}
