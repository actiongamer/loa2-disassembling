package nslm2.modules.foundations.shop
{
   import game.ui.heroShowModule.MysteryShopHeroPieceRenderUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.RTools;
   import nslm2.common.model.PlayerModel;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import proto.HeroShopShardLockReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.HeroShopShardLockRes;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import proto.BoolMap;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.customs.FilterLib;
   import proto.Item;
   import com.mz.core.mediators.RollMediator;
   
   public class MysteryShopHeroPieceRender extends MysteryShopHeroPieceRenderUI implements IObserver
   {
       
      
      public function MysteryShopHeroPieceRender()
      {
         super();
         this.btn_getPoint.addEventListener("click",btn_getPoint_handler);
         this.parts.push(new RollMediator(this,onRoll));
         this.buttonMode = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.wealthVo == null)
         {
            this.removeEventListener("click",btn_handler);
            this.box1.visible = false;
            this.btn_getPoint.visible = true;
         }
         else
         {
            this.addEventListener("click",btn_handler);
            ObserverMgr.ins.regObserver(this);
            this.box1.visible = true;
            this.btn_getPoint.visible = false;
            this.txt_shard_num.text = LocaleMgr.ins.getStr(999902515) + wealthVo.count.toString();
            _loc4_ = "";
            _loc5_ = WealthVo.parseCostStr(shopVo.sell_res);
            _loc3_ = StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_QUALITY").define_value.split("|");
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               if(_loc3_[_loc6_] == _loc5_.quality)
               {
                  _loc2_ = WealthVo.parseCostStr(StcMgr.ins.getDefineVo("HERO_SHOP_SHARD_LOCK_COST").define_value.split("|")[_loc6_]);
                  this.txt_price1.text = "@{wealth:" + _loc2_.kind + "}" + _loc2_.count.toString();
                  break;
               }
               _loc6_++;
            }
            this.txt_price.text = "@{wealth:" + WealthUtil.parseCostStr(shopVo.curr_res).kind + "}" + WealthUtil.parseCostStr(shopVo.curr_res).count.toString();
         }
      }
      
      public function get shopVo() : StcShopVo
      {
         return _dataSource as StcShopVo;
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_dataSource == null)
         {
            return null;
         }
         return WealthUtil.parseCostStr(_dataSource.sell_res);
      }
      
      override protected function validateImgIcon() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            _loc1_ = UrlLib.npcDialogIcon(_loc2_.head_id);
            ResMgr.ins.load(1,_loc1_,loadIconUrlCpl);
            this.img_icon.url = _loc1_;
         }
      }
      
      private function loadIconUrlCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.img_mask.cacheAsBitmap = true;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = this.img_mask;
         showPieceTip(UrlLib.piece_tip_big(),39,44);
         var _loc1_:int = 6;
         icon_pieceTip.right = _loc1_;
         icon_pieceTip.top = _loc1_;
      }
      
      override protected function validateTxtName() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_txt_name.color = ColorLib.qualityColor(_loc1_.quality);
            this.ref_txt_name.text = HeroInfoUtil.getName(null,_loc1_.id,true);
            this.txt_nick.visible = RTools.cl(true,false);
            this.txt_nick.text = HeroInfoUtil.getHtmlNameHasTupoLevel(_loc1_.id,false,false);
            this.ref_txt_name.visible = true;
            if(false && _loc1_.career_id)
            {
               this.img_career.url = UrlLib.npcTypeIcon(_loc1_.career_id);
               this.img_career.visible = true;
            }
            else
            {
               this.img_career.visible = false;
            }
         }
      }
      
      override protected function validateQuality() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_img_quality.url = UrlLib.npcPieceQualityBg(_loc1_.quality);
            ref_img_quality.visible = true;
            this.img_bg.visible = false;
         }
         else
         {
            this.img_bg.visible = true;
            ref_img_quality.visible = false;
         }
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         param1 = PlayerModel.ins.getCountByWealthVo(wealthVo);
         if(param1 < wealthVo.stcItemVo.heroPieceNeed)
         {
            this.ref_txt_num.color = 16723968;
         }
         else
         {
            this.ref_txt_num.color = 458496;
         }
         this.ref_txt_num.visible = true;
         this.ref_txt_num.text = LocaleMgr.ins.getStr(999000045) + param1 + "/" + wealthVo.stcItemVo.heroPieceNeed;
      }
      
      private function btn_handler(param1:MouseEvent) : void
      {
         AlertUtil.comfirm(LocaleMgr.ins.getStr(999902516,[HeroInfoUtil.getHtmlNameHasTupoLevel(wealthVo.stcItemVo.heroPiece_stcNpcId,false,false) + "?"]),onOK);
      }
      
      private function onOK() : void
      {
         var _loc1_:HeroShopShardLockReq = new HeroShopShardLockReq();
         _loc1_.itemId = shopVo.id;
         _loc1_.lock = true;
         _loc1_.shopType = 60310 + 100000;
         ServerEngine.ins.send(10032,_loc1_,onServerCpl_Lock);
      }
      
      private function onServerCpl_Lock(param1:HeroShopShardLockRes) : void
      {
         ShopModel.ins.lockItem = new BoolMap();
         ShopModel.ins.lockItem.key = shopVo.id;
         ShopModel.ins.lockItem.value = true;
         while(ShopModel.ins.lockBuyedItems.length > 0)
         {
            ShopModel.ins.lockBuyedItems.shift();
         }
         ArrayUtil.fillVectorFromArr(ShopModel.ins.lockBuyedItems,param1.lockFreshBuy);
         ObserverMgr.ins.sendNotice("EVT_MYSTERY_SHOP_LOCK_ITEM",param1.status);
         ModuleMgr.ins.closeModule(1410065407);
      }
      
      private function btn_getPoint_handler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_PIECE_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function onRoll(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this.wealthVoIsEnable)
         {
            if(param1)
            {
               _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
               this.filters = [FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_.quality))];
            }
            else
            {
               this.filters = null;
            }
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("msg_item_num_change" === _loc4_)
         {
            _loc3_ = param2 as Item;
            if(this.wealthVo.kind == 20 && this.wealthVo.sid == _loc3_.itemId)
            {
               this.validateTxtNum();
               this.validateTxtName();
            }
         }
      }
      
      override protected function validateIconMask() : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_item_num_change"]);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
