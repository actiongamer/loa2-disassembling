package nslm2.modules.cultivates.fashionAcc
{
   import game.ui.fashionAcc.FashionAccMakeModuleUI;
   import nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import morn.customs.FilterLib;
   import nslm2.modules.cultivates.fashionAcc.render.WealthRenderS14ForFashionAcc;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.components.PanelBgS3;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.vo.WealthVo;
   import proto.FashionMakeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FashionXiLianReq;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import proto.FashionMakeRes;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import proto.FashionList;
   import proto.FashionXiLianRes;
   import nslm2.modules.cultivates.fashionAcc.render.FashionAccMaterialRender;
   import nslm2.utils.WealthUtil;
   import morn.core.utils.ObjectUtils;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.customs.components.WealthRender;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import nslm2.common.uiEffects.FlyTarget;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class FashionAccModule extends FashionAccMakeModuleUI
   {
       
      
      private const RENDER1_XY:Array = [295,114];
      
      private const RENDER2_XY:Array = [464,115];
      
      private const RENDER3_XY:Array = [375,277];
      
      private var model:FashionAccModel;
      
      private var breathCtrl:GlowFilterBreathCtrl;
      
      private var curAccLength:uint;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      public function FashionAccModule()
      {
         model = FashionAccModel.ins;
         super();
      }
      
      public function addBreath() : void
      {
         breathCtrl = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_ORANGE).addHandler(breath_cb);
         this.parts.push(breathCtrl);
      }
      
      private function breath_cb(param1:Array) : void
      {
         if(model.curFashionAccId == 0)
         {
            this.txt_selectHint.filters = param1;
         }
         else
         {
            this.txt_selectHint.filters = null;
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.list_acc.itemRender = WealthRenderS14ForFashionAcc;
         var _loc2_:Array = BagModel.ins.getFashionAccArr(0);
         if(_loc2_.length == 0 || _loc2_.length % 12)
         {
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < 12 - _loc3_ % 12)
            {
               _loc2_.push(null);
               _loc4_++;
            }
         }
         this.list_acc.dataSource = _loc2_;
         RoleTeamModel.ins.blockFloatMsg = true;
         (pageBarUI as PageBarS2).bindList(list_acc);
         pieceRenderCenter.buttonMode = true;
         pieceRenderCenter.addEventListener("click",centerClick);
         pieceRenderCenter.img_bg.visible = false;
         pieceRenderCenter.txt_countAndNeed.visible = false;
         pieceRenderCenter.txt_name.visible = false;
         this.panelBg.titleImgId = this.moduleId;
         this.pieceRender0.buttonMode = true;
         this.pieceRender1.buttonMode = true;
         this.pieceRender0.addEventListener("click",render1Handler);
         this.pieceRender1.addEventListener("click",render2Handler);
         this.tabBar.labels = [LocaleMgr.ins.getStr(31200000),LocaleMgr.ins.getStr(31200001)].join(",");
         this.tabBar.selectHandler = tabHandler;
         this.tabBar.selectedIndex = 0;
         (this.panelBg as PanelBgS3).img_frame.bottom = 10;
         this.img_iconCenter.alpha = 0;
         refresh();
         this.btn_make.clickHandler = makeHandler;
         super.preShowCpl();
      }
      
      protected function render1Handler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(pieceRender0.dataSource as WealthVo),this.moduleId);
      }
      
      protected function render2Handler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(pieceRender1.dataSource as WealthVo),this.moduleId);
      }
      
      private function tabHandler() : void
      {
         if(tabBar.selectedIndex == 1)
         {
            this.img_grid.skin = "png.uiFashionUpgrade.打造界面.低01";
            this.txt_selectHint.text = LocaleMgr.ins.getStr(31200010);
         }
         else
         {
            this.img_grid.skin = "png.uiFashionUpgrade.打造界面.低1";
            this.txt_selectHint.text = LocaleMgr.ins.getStr(31200007);
         }
         model.curFashionAccId = 0;
         refresh();
      }
      
      private function makeHandler() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(isMake())
         {
            _loc1_ = new FashionMakeReq();
            _loc1_.targetId = model.curFashionAccId;
            ServerEngine.ins.send(6284,_loc1_,makeCpl,makeErr);
         }
         else
         {
            _loc2_ = new FashionXiLianReq();
            _loc2_.targetId = model.curFashionAccId;
            ServerEngine.ins.send(6285,_loc2_,refreshCpl,resfreshErr);
         }
      }
      
      private function makeErr(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 300004024)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31200009));
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function resfreshErr(param1:ProtocolStatusRes) : *
      {
         if(param1.errCode == 300006090)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210003));
         }
      }
      
      private function makeCpl(param1:FashionMakeRes) : void
      {
         curAccLength = BagModel.ins.getFashionAccArr(0).length;
         FashionModel.ins.fashionAccSkillDict.put(param1.skillId,param1.skillNum);
         var _loc2_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         var _loc3_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(_loc2_.skill);
         var _loc5_:StcSkillVo = StcMgr.ins.getSkillVo(_loc3_.skillId);
         this.txt_skillNum.text = LocaleMgr.ins.getStr(_loc5_.skill_description1,[param1.skillNum * (Math.abs(_loc3_.intRange) == 1?1:100) / Math.abs(_loc3_.intRange) + (Math.abs(_loc3_.intRange) == 1?"":"%")]);
         var _loc4_:FashionList = new FashionList();
         _loc4_.id = model.curFashionAccId;
         _loc4_.curUseId = false;
         _loc4_.skillNum = 0;
         FashionModel.ins.fashionAccArr.push(_loc4_);
      }
      
      private function refreshCpl(param1:FashionXiLianRes) : void
      {
         var _loc5_:int = 0;
         if(FashionModel.ins.fashionAccSkillDict.getValue(param1.skillId) == param1.skillNum)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210001));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210002));
         }
         FashionModel.ins.fashionAccSkillDict.put(param1.skillId,param1.skillNum);
         var _loc2_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         var _loc3_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(_loc2_.skill);
         var _loc4_:StcSkillVo = StcMgr.ins.getSkillVo(_loc3_.skillId);
         this.txt_skillNum.text = LocaleMgr.ins.getStr(_loc4_.skill_description1,[param1.skillNum * (Math.abs(_loc3_.intRange) == 1?1:100) / Math.abs(_loc3_.intRange) + (Math.abs(_loc3_.intRange) == 1?"":"%")]);
         _loc5_ = 0;
         while(_loc5_ < 2)
         {
            if(this.hasOwnProperty("pieceRender" + _loc5_))
            {
               (this["pieceRender" + _loc5_] as FashionAccMaterialRender).visible = true;
               (this["pieceRender" + _loc5_] as FashionAccMaterialRender).dataSource = WealthUtil.costStrToVo((!!isMake()?_loc2_.costItem:_loc2_.xilianCost).split("|")[_loc5_]);
            }
            _loc5_++;
         }
      }
      
      protected function centerClick(param1:MouseEvent) : void
      {
         if(isMake())
         {
            ModuleMgr.ins.showModule(31210,null,31200);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31200010));
         }
      }
      
      private function isMake() : Boolean
      {
         return tabBar.selectedIndex < 1;
      }
      
      private function refresh() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc1_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         if(model.curFashionAccId)
         {
            _loc5_ = 0;
            while(_loc5_ < 2)
            {
               if(this.hasOwnProperty("pieceRender" + _loc5_))
               {
                  (this["pieceRender" + _loc5_] as FashionAccMaterialRender).visible = true;
                  (this["pieceRender" + _loc5_] as FashionAccMaterialRender).dataSource = WealthUtil.costStrToVo((!!isMake()?_loc1_.costItem:_loc1_.xilianCost).split("|")[_loc5_]);
               }
               _loc5_++;
            }
            if(isMake())
            {
               this.costRender.visible = true;
               this.costRender.dataSource = WealthUtil.costStrToVo(_loc1_.extraCost);
               this.list_acc.selectHandler = null;
               this.box_skill.visible = false;
            }
            else
            {
               this.skillRender.visible = true;
               this.costRender.visible = false;
               this.list_acc.selectHandler = accHandler;
               ObjectUtils.gray(this.pieceRenderCenter,false);
               this.box_skill.visible = true;
               _loc2_ = StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill);
               _loc4_ = StcMgr.ins.getSkillVo(_loc2_.skillId);
               this.txt_skillNum.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill).skillId).skill_description1,[int(FashionModel.ins.fashionAccSkillDict.getValue(model.curFashionAccId)) * (Math.abs(_loc2_.intRange) == 1?1:100) / Math.abs(_loc2_.intRange) + (Math.abs(_loc2_.intRange) == 1?"":"%")]);
               this.skillRender.dataSource = _loc2_.skillId;
            }
            this.txt_selectHint.visible = false;
            pieceRenderCenter.dataSource = WealthUtil.createItemVo(_loc1_.item);
            this.img_iconCenter.buttonMode = false;
            this.img_iconCenter.removeEventListener("click",centerClick);
            if(flickerTxtExpPre)
            {
               flickerTxtExpPre.dispose();
               flickerTxtExpPre = null;
               this.img_plus.alpha = 0;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               if(this.hasOwnProperty("pieceRender" + _loc3_))
               {
                  (this["pieceRender" + _loc3_] as FashionAccMaterialRender).visible = false;
               }
               _loc3_++;
            }
            if(!isMake())
            {
               this.list_acc.selectHandler = accHandler;
               this.list_acc.selectedIndex = -1;
               if(flickerTxtExpPre)
               {
                  flickerTxtExpPre.dispose();
                  flickerTxtExpPre = null;
                  this.img_plus.alpha = 0;
               }
            }
            else
            {
               this.list_acc.selectHandler = null;
               if(!flickerTxtExpPre)
               {
                  flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
               }
               flickerTxtExpPre.resume();
            }
            pieceRenderCenter.img_bg.visible = false;
            pieceRenderCenter.txt_countAndNeed.visible = false;
            pieceRenderCenter.txt_name.visible = false;
            pieceRenderCenter.dataSource = null;
            this.img_iconCenter.buttonMode = true;
            this.img_iconCenter.addEventListener("click",centerClick);
            this.box_skill.visible = false;
            this.costRender.visible = false;
            this.txt_selectHint.visible = true;
            if(!breathCtrl)
            {
               this.addBreath();
            }
         }
         if(isMake())
         {
            this.btn_make.label = LocaleMgr.ins.getStr(31200000);
         }
         else
         {
            this.btn_make.label = LocaleMgr.ins.getStr(31200001);
         }
         checkCanMake();
      }
      
      private function accHandler() : void
      {
         if(!list_acc.selectedItem)
         {
            return;
         }
         model.curFashionAccId = (StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",(list_acc.selectedItem as WealthVo).sid) as StcFashionSynVo).id;
         new IconFlyEff(IconFlyEff.copyImage((list_acc.selection as WealthRender).ref_img_icon),(list_acc.selection as WealthRender).ref_img_icon,this.pieceRenderCenter).addHandlers(new Handler(skillEffCpl,[])).exec();
      }
      
      private function skillEffCpl() : void
      {
         refresh();
      }
      
      private function checkCanMake() : void
      {
         if(model.curFashionAccId == 0)
         {
            this.btn_make.disabled = true;
         }
         else
         {
            this.btn_make.disabled = false;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["refresh_acc","acc_make_cpl","msg_item_num_change"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:* = param1;
         if("msg_item_num_change" !== _loc9_)
         {
            if("refresh_acc" !== _loc9_)
            {
               if("acc_make_cpl" === _loc9_)
               {
                  _loc3_ = BagModel.ins.getFashionAccArr(0);
                  if(isMake() && model.curFashionAccId)
                  {
                     _loc4_ = WealthUtil.createItemVo(StcMgr.ins.getFashionSynVo(model.curFashionAccId).item);
                     FloatUtil.showGetItemsDisplayPanel([_loc4_]);
                     if(_loc3_.length == 0 || _loc3_.length % 12)
                     {
                        _loc6_ = _loc3_.length;
                        _loc7_ = 0;
                        while(_loc7_ < 12 - _loc6_ % 12)
                        {
                           _loc3_.push(null);
                           _loc7_++;
                        }
                     }
                     _loc9_ = 0;
                     var _loc8_:* = NpcPropVo.parseArrStr(StcMgr.ins.getFashionSynVo(model.curFashionAccId).prop);
                     for each(var _loc5_ in NpcPropVo.parseArrStr(StcMgr.ins.getFashionSynVo(model.curFashionAccId).prop))
                     {
                        AlertUtil.showPropChangeTip(NPCPropConsts.ins.getLocaleNameNormal(_loc5_.propId),_loc5_.value,null,null,DisplayUtils.globarCenter(this).add(new Point(0,-50)));
                     }
                     this.list_acc.dataSource = _loc3_;
                     this.list_acc.selectedIndex = -1;
                     model.curFashionAccId = 0;
                     refresh();
                  }
               }
            }
            addr142:
            return;
         }
         refresh();
         §§goto(addr142);
      }
      
      public function getToTargetFromWealthRender(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         var _loc3_:* = undefined;
         if((param2 as WealthRender).wealthVoIsEnable)
         {
            _loc3_ = new FlyTarget(list_acc.getCell(!!list_acc.dataSource?(list_acc.dataSource as Array).length:0),DisplayUtils.globarCenter(list_acc.getCell((list_acc.dataSource as Array).length)));
         }
         return _loc3_;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("evt_refresh_acc_list");
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preCloseCpl();
      }
   }
}
