package nslm2.modules.foundations.shop
{
   import game.ui.shopModules.MysteryShopHeroShardListModuleUI;
   import com.mz.core.utils.DictHash;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMysticShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MysteryShopHeroShardListModule extends MysteryShopHeroShardListModuleUI
   {
       
      
      private var ds:DictHash;
      
      public function MysteryShopHeroShardListModule()
      {
         super();
         initData();
         this.list_items.itemRender = MysteryShopHeroPieceRender;
         this.tabBar.labels = [LocaleMgr.ins.getStr(5100 + 1),LocaleMgr.ins.getStr(5100 + 2),LocaleMgr.ins.getStr(5100 + 3)].join(",");
         this.pageBarS2.bindList(this.list_items);
         this.tabBar.selectHandler = onTabBarChanged;
      }
      
      public function get pageBarS2() : PageBarS2
      {
         return this.pageBar as PageBarS2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.onTabBarChanged(0);
         this.preShowCpl();
      }
      
      private function onTabBarChanged(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               this.list_items.dataSource = sortArr(ds.getValue(1) as Array);
               break;
            case 1:
               this.list_items.dataSource = sortArr(ds.getValue(2) as Array);
               break;
            case 2:
               this.list_items.dataSource = sortArr(ds.getValue(3) as Array);
         }
         this.list_items.commitMeasure();
         this.pageBarS2.bindList(this.list_items);
      }
      
      private function initData() : void
      {
         var _loc6_:int = 0;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         ds = new DictHash();
         ds.put(1,[]);
         ds.put(2,[]);
         ds.put(3,[]);
         var _loc4_:Array = StcMgr.ins.getVoArrByColumnValue("static_mystic_shop","shop_type",60310 + 100000);
         var _loc3_:int = _loc4_.length;
         while(_loc6_ < _loc3_)
         {
            _loc1_ = _loc4_[_loc6_];
            if(!(_loc1_.weight == 0 && _loc1_.super_weight == 0))
            {
               _loc5_ = StcMgr.ins.getShopVo(_loc1_.item_id);
               _loc2_ = WealthUtil.parseCostStr(_loc5_.sell_res);
               if(_loc2_.kind == 20 && _loc2_.stcItemVo.kind == 21 && WealthUtil.parseCostStr(_loc5_.curr_res).kind == 15 && StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_QUALITY").define_value.indexOf(_loc2_.stcItemVo.quality.toString()) >= 0)
               {
                  if(ArrayUtil.indexByAttr(ds.getValue(StcMgr.ins.getNpcVo(_loc2_.stcItemVo.heroPiece_stcNpcId).group),"sell_res",_loc5_.sell_res) < 0)
                  {
                     (ds.getValue(StcMgr.ins.getNpcVo(_loc2_.stcItemVo.heroPiece_stcNpcId).group) as Array).push(_loc5_);
                  }
               }
            }
            _loc6_++;
         }
      }
      
      private function sortArr(param1:Array) : Array
      {
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc7_ = WealthVo.parseCostStr(_loc2_.sell_res);
            _loc5_ = WealthUtil.parseCostStr(_loc2_.curr_res);
            if(_loc7_.stcItemVo && _loc7_.stcItemVo.kind == 21)
            {
               if(HeroModel.ins.checkHeroInTeam(_loc7_.stcItemVo.heroPiece_stcNpcId))
               {
                  _loc3_.push({
                     "in_use":1,
                     "id":_loc2_.id,
                     "is_piece":1,
                     "res":_loc5_.kind,
                     "price":_loc5_.count,
                     "color":StcMgr.ins.getNpcVo(_loc7_.stcItemVo.heroPiece_stcNpcId).quality,
                     "npc_id":_loc7_.stcItemVo.heroPiece_stcNpcId,
                     "ds":_loc2_
                  });
               }
               else
               {
                  _loc3_.push({
                     "in_use":0,
                     "id":_loc2_.id,
                     "is_piece":1,
                     "res":_loc5_.kind,
                     "price":_loc5_.count,
                     "color":StcMgr.ins.getNpcVo(_loc7_.stcItemVo.heroPiece_stcNpcId).quality,
                     "npc_id":_loc7_.stcItemVo.heroPiece_stcNpcId,
                     "ds":_loc2_
                  });
               }
            }
         }
         _loc3_.sort(highSort);
         var _loc4_:Array = [];
         var _loc11_:int = 0;
         var _loc10_:* = _loc3_;
         for each(var _loc6_ in _loc3_)
         {
            _loc4_.push(_loc6_.ds);
         }
         return _loc4_;
      }
      
      private function highSort(param1:*, param2:*) : int
      {
         if(param1.in_use > param2.in_use)
         {
            return -1;
         }
         if(param1.in_use < param2.in_use)
         {
            return 1;
         }
         if(param1.res > param2.res)
         {
            return -1;
         }
         if(param2.res > param1.res)
         {
            return 1;
         }
         if(param1.color > param2.color)
         {
            return -1;
         }
         if(param2.color > param1.color)
         {
            return 1;
         }
         if(param1.npc_id > param2.npc_id)
         {
            return 1;
         }
         if(param2.npc_id > param1.npc_id)
         {
            return -1;
         }
         if(param1.price > param2.price)
         {
            return 1;
         }
         if(param2.price > param1.price)
         {
            return -1;
         }
         return 0;
      }
   }
}
