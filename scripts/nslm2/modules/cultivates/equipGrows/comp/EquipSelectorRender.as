package nslm2.modules.cultivates.equipGrows.comp
{
   import game.ui.equipGrows.equipSelectors.EquipSelectorRenderUI;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import morn.core.components.Label;
   import flash.events.MouseEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class EquipSelectorRender extends EquipSelectorRenderUI
   {
       
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var starNum:Label;
      
      public function EquipSelectorRender()
      {
         starNum = new Label();
         super();
         box_equip.buttonMode = true;
         this.box_equip.addEventListener("click",clickIconHandler);
         img_selectedBg.visible = false;
         this.parts.push(new RollHighLightMediator(this,img_bg));
      }
      
      protected function clickIconHandler(param1:MouseEvent) : void
      {
         btnClickHandler(null);
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
      
      override public function get wealthVo() : WealthVo
      {
         return (dataSource as HeroEquipVo).wealthVo;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         img_selectedBg.visible = param1 == 3;
      }
      
      private function btnClickHandler(param1:Object) : void
      {
         if(BagModel.ins.hasEquipInBg((dataSource as HeroEquipVo).place))
         {
            ObserverMgr.ins.sendNotice("equip_show_selecte_equip_panel",[box_equip,dataSource]);
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.EQUIP_LESS_ID)),30500);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(!wealthVo.item)
         {
            if(BagModel.ins.hasEquipInBg(dataSource.place))
            {
               if(!flickerTxtExpPre)
               {
                  flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
               }
               flickerTxtExpPre.resume();
               img_plus.visible = true;
            }
            else
            {
               removePlus();
            }
            img_redPoint.visible = false;
            this.label_warn.visible = false;
            this.list_stars.visible = false;
            this.starNum.visible = false;
         }
         else
         {
            _loc2_ = StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId);
            img_redPoint.visible = BagModel.ins.hasBetterEquip(wealthVo,int(wealthVo.extraData)) || _loc2_.level == 0 && FloatBubbleUtil.checkInLevel(4);
            removePlus();
            if(FuncOpenAutoCtrl.checkOpen(30502) && wealthVo.stcItemVo.quality > 4)
            {
               if(StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId).level < 100)
               {
                  this.label_warn.color = 16723968;
                  this.list_stars.visible = false;
                  this.starNum.visible = false;
                  this.label_warn.visible = false;
               }
               else
               {
                  _loc3_ = EquipGrowModel.getStarLightArray(wealthVo.item.star,wealthVo.stcItemVo.quality);
                  if(_loc3_.length > 5)
                  {
                     this.list_stars.x = 142;
                     this.list_stars.repeatX = 1;
                     starNum.text = "x" + _loc3_.length;
                     starNum.x = list_stars.x + 12;
                     starNum.y = list_stars.y - 3;
                     this.addChild(starNum);
                     this.starNum.visible = true;
                  }
                  else
                  {
                     this.list_stars.repeatX = _loc3_.length;
                     this.starNum.visible = false;
                     this.list_stars.x = 125 + (5 - _loc3_.length) * 6;
                  }
                  this.list_stars.dataSource = _loc3_;
                  this.list_stars.visible = true;
                  this.label_warn.visible = false;
               }
            }
            else
            {
               this.label_warn.visible = false;
               this.list_stars.visible = false;
               this.starNum.visible = false;
            }
         }
      }
      
      private function removePlus() : void
      {
         if(flickerTxtExpPre)
         {
            flickerTxtExpPre.dispose();
         }
         img_plus.visible = false;
      }
      
      override protected function validateTxtName() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         if(this.ref_txt_name != null)
         {
            if(wealthVo && wealthVo.item)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(wealthVo.quality);
               this.ref_txt_name.text = wealthVo.showName;
               this.ref_txt_name.visible = true;
               _loc2_ = wealthVo.item.strengthId;
               _loc1_ = wealthVo.item.jinglianId;
               if(_loc2_ > 0)
               {
                  _loc4_ = StcMgr.ins.getEquipStrengthVo(_loc2_).level;
               }
               if(_loc1_ > 0)
               {
                  _loc3_ = StcMgr.ins.getEquipJinglianVo(_loc1_).level;
               }
               this.ref_txt_name.text = wealthVo.showName;
               if(_loc4_)
               {
                  this.txt_stren.text = LocaleMgr.ins.getStr(10220007) + " +" + _loc4_;
               }
               else
               {
                  this.txt_stren.text = "";
               }
               if(_loc3_)
               {
                  if(App.language == "en" || App.language == "de" || App.language == "fr")
                  {
                     this.txt_jinlian.text = LocaleMgr.ins.getStr(30100081) + " " + LocaleMgr.ins.getStr(30100082) + _loc3_;
                  }
                  else
                  {
                     this.txt_jinlian.text = LocaleMgr.ins.getStr(30100081) + " " + _loc3_ + LocaleMgr.ins.getStr(30100082);
                  }
               }
               else
               {
                  this.txt_jinlian.text = "";
               }
               this.ref_img_icon.visible = true;
               this.ref_txt_name.visible = true;
            }
            else
            {
               img_equipIcon.skin = "png.a5.commonImgs.img_equipRenderBgSmall" + (dataSource as HeroEquipVo).place;
               this.ref_img_icon.visible = false;
               this.ref_txt_name.visible = false;
               this.txt_stren.text = "";
               this.txt_jinlian.text = "";
            }
         }
      }
   }
}
