package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleEquipRenderUI;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Label;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.QualityConsts;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class RoleEquipRender extends RoleEquipRenderUI
   {
       
      
      private var eff:BmcSpriteSheet;
      
      private var starNum:Label;
      
      public function RoleEquipRender()
      {
         starNum = new Label();
         super();
         this.buttonMode = true;
         img_icon.smoothing = true;
         img_redPoint.mouseEnabled = true;
         img_redPoint.addEventListener("click",showSelectEquipPanel);
         this.parts.push(new RollHighLightMediator(this));
      }
      
      protected function showSelectEquipPanel(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:int = equipVo.place < 8?1:2;
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_equip_panel",[this,equipVo,_loc2_]);
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(equipVo)
         {
            return equipVo.wealthVo;
         }
         return null;
      }
      
      public function get equipVo() : HeroEquipVo
      {
         return dataSource as HeroEquipVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         refresh();
         ObserverMgr.ins.regObserver(this);
      }
      
      private function refresh() : void
      {
         var _loc1_:* = null;
         if(equipVo)
         {
            this.img_bg.skin = "png.a5.commonImgs.img_equipRenderBg" + equipVo.place;
         }
         if(!wealthVo)
         {
            if(!eff)
            {
               eff = new BmcSpriteSheet();
               eff.x = -11;
               eff.y = -10;
               eff.init(1050,1,"all",true);
               addChild(eff);
            }
            else
            {
               eff.gotoAndPlay(1);
            }
            if(RoleInfoModel.ins.heroInfo && (BagModel.ins.hasEquipInBg(equipVo.place) || TreasureModel.ins.hasTreasureInBg(equipVo.place)))
            {
               img_redPoint.visible = true;
            }
            else
            {
               if(equipVo.place < 8 && FuncOpenAutoCtrl.checkOpen(30500) == false || equipVo.place >= 8 && FuncOpenAutoCtrl.checkOpen(30600) == false)
               {
                  removeEff();
               }
               img_redPoint.visible = false;
            }
            box_lvl.visible = false;
            list_stars.visible = false;
            starNum.visible = false;
            this.label_jinglian.visible = false;
         }
         else
         {
            validateListStars();
            box_lvl.visible = true;
            if(equipVo.place < 8)
            {
               _loc1_ = StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId);
               if(_loc1_)
               {
                  txt_lvl.text = _loc1_.level + "";
               }
               else
               {
                  txt_lvl.text = "0";
               }
               img_redPoint.visible = BagModel.ins.hasBetterEquip(wealthVo,int(wealthVo.extraData));
            }
            else
            {
               txt_lvl.text = wealthVo.treasure.level + "";
               img_redPoint.visible = TreasureModel.ins.hasBetterTreasure(wealthVo);
            }
            if(FuncOpenAutoCtrl.checkOpen(30501) && wealthVo.item && StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level > 0)
            {
               this.label_jinglian.visible = true;
               if(ClientConfig.isChineseLang())
               {
                  label_jinglian.text = StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level + LocaleMgr.ins.getStr(999001135);
               }
               else
               {
                  label_jinglian.text = LocaleMgr.ins.getStr(999001135) + StcMgr.ins.getEquipJinglianVo(wealthVo.item.jinglianId).level;
               }
               label_jinglian.color = QualityConsts.getQuColor(wealthVo.quality);
            }
            else
            {
               this.label_jinglian.visible = false;
            }
            txt_name.x = this.width - txt_name.width >> 1;
            label_jinglian.x = txt_name.x + txt_name.width + 5;
            WealthUtil.changeQualitySkin(this.img_lvlBg,wealthVo.quality);
            removeEff();
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["notice_refresh_module_need_resource_data"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         ObserverMgr.ins.regObserver(this);
         var _loc3_:* = param1;
         if("notice_refresh_module_need_resource_data" === _loc3_)
         {
            refresh();
         }
      }
      
      override protected function validateQuality() : void
      {
         if(this.ref_img_quality)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,wealthVo.quality);
               ref_img_quality.visible = true;
            }
            else
            {
               WealthUtil.changeQualitySkin(this.ref_img_quality,1);
            }
         }
      }
      
      private function removeEff() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
