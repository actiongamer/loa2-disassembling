package nslm2.modules.cultivates.skillChangePanels
{
   import game.ui.skillChangePanel.SkillChangeModuleUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.cultivates.fashionAcc.service.FashionAccService;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.handlers.Handler;
   import nslm2.modules.cultivates.fashion.FashionService;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.common.ctrls.TSM;
   
   public class SkillChangeModule extends SkillChangeModuleUI
   {
       
      
      private var _skillSelectPanel:nslm2.modules.cultivates.skillChangePanels.SkillSelectPanel;
      
      private var _tsms:TSMDict;
      
      private var _skillKindArr:Array;
      
      private var _showingEffectIdArr:Array;
      
      private var _needClearType:Array;
      
      public function SkillChangeModule()
      {
         _tsms = new TSMDict();
         _skillKindArr = [1,0,2,3,4];
         _showingEffectIdArr = [];
         _needClearType = [];
         super();
         _skillSelectPanel = new nslm2.modules.cultivates.skillChangePanels.SkillSelectPanel();
         _skillSelectPanel.x = 380;
         this.addChildAt(_skillSelectPanel,0);
         _tsms.put(box_main,new TSM(this.box_main,0.3)).addState(2,{}).addState(1,{"x":-100});
         _tsms.put(_skillSelectPanel,new TSM(this._skillSelectPanel,0.3)).addState(1,{}).addState(2,{
            "alpha":0,
            "x":200
         });
         this.img_selectBox.visible = false;
         this.list_skills.changeHandler = onChangeClick;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.addEventListener("evtNorSkillSelect",serviceHandler);
            this.addEventListener("evtSpeSkillSelect",serviceHandler);
            this.addEventListener("evtAuraSkillSelect",serviceHandler);
            FashionModel.ins.addEventListener("evtSkillUsingChange",onSkillUsingChange);
            HorseService.ins.addEventListener("evtAuraUsingChange",onSkillUsingChange);
            FashionAccService.ins.addEventListener("evt_acc_skill_using_change",onSkillUsingChange);
            this.addEventListener("select_skill_kind_right",serviceHandler);
            this.addEventListener("select_skill_kind_right",serviceHandler);
            _skillSelectPanel.addEventListener("close",onSelectClose);
         }
         else
         {
            this.removeEventListener("evtNorSkillSelect",serviceHandler);
            this.removeEventListener("evtSpeSkillSelect",serviceHandler);
            this.removeEventListener("evtAuraSkillSelect",serviceHandler);
            FashionModel.ins.removeEventListener("evtSkillUsingChange",onSkillUsingChange);
            HorseService.ins.removeEventListener("evtAuraUsingChange",onSkillUsingChange);
            this.removeEventListener("select_skill_kind_right",serviceHandler);
            this.removeEventListener("select_skill_kind_right",serviceHandler);
            FashionAccService.ins.removeEventListener("evt_acc_skill_using_change",onSkillUsingChange);
            _skillSelectPanel.removeEventListener("close",onSelectClose);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         this.list_skills.dataSource = _skillKindArr;
         this.list_skills.commitMeasure();
         _tsms.toState(2);
         this.preShowCpl();
      }
      
      private function serviceHandler(param1:MzEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:FashionEffectVO = param1.data as FashionEffectVO;
         if(_showingEffectIdArr.indexOf(_loc2_.id) != -1)
         {
            return;
         }
         if(SkillChangeModel.ins.isUsing(_loc2_.id) == false)
         {
            _showingEffectIdArr.push(_loc2_.id);
            _loc3_ = new Image(_loc2_.image.url);
            _loc3_.scale = 0.8;
            var _loc4_:* = param1.type;
            if("evtSpeSkillSelect" !== _loc4_)
            {
               if("evtNorSkillSelect" !== _loc4_)
               {
                  if("evtAuraSkillSelect" !== _loc4_)
                  {
                     if("select_skill_kind_right" !== _loc4_)
                     {
                        if("select_skill_kind_right" === _loc4_)
                        {
                           new IconFlyEff(_loc3_,_loc2_.startPoint,(this.list_skills.getCell(4) as SkillKindRender).img_icon).addHandlers(new Handler(skillEffCpl,[param1])).exec();
                        }
                     }
                     else
                     {
                        new IconFlyEff(_loc3_,_loc2_.startPoint,(this.list_skills.getCell(3) as SkillKindRender).img_icon).addHandlers(new Handler(skillEffCpl,[param1])).exec();
                     }
                  }
                  else
                  {
                     new IconFlyEff(_loc3_,_loc2_.startPoint,(this.list_skills.getCell(2) as SkillKindRender).img_icon).addHandlers(new Handler(skillEffCpl,[param1])).exec();
                  }
               }
               else
               {
                  new IconFlyEff(_loc3_,_loc2_.startPoint,(this.list_skills.getCell(1) as SkillKindRender).img_icon).addHandlers(new Handler(skillEffCpl,[param1])).exec();
               }
            }
            else
            {
               new IconFlyEff(_loc3_,_loc2_.startPoint,(this.list_skills.getCell(0) as SkillKindRender).img_icon).addHandlers(new Handler(skillEffCpl,[param1])).exec();
            }
         }
      }
      
      private function skillEffCpl(param1:MzEvent) : void
      {
         var _loc2_:FashionEffectVO = param1.data as FashionEffectVO;
         var _loc3_:* = param1.type;
         if("evtNorSkillSelect" !== _loc3_)
         {
            if("evtSpeSkillSelect" !== _loc3_)
            {
               if("evtAuraSkillSelect" !== _loc3_)
               {
                  if("select_skill_kind_right" === _loc3_)
                  {
                     FashionAccService.ins.changeSkill(_loc2_.id);
                  }
               }
               else
               {
                  HorseService.ins.changeAura(_loc2_.id);
               }
            }
            else if(_loc2_.id == SkillChangeModel.ins.getPlayerInitSpeSkill())
            {
               FashionService.ins.clothesSkill(1,0);
            }
            else
            {
               FashionService.ins.clothesSkill(1,_loc2_.id);
            }
         }
         else if(_loc2_.id == SkillChangeModel.ins.getPlayerInitNorSkill())
         {
            FashionService.ins.clothesSkill(0,0);
         }
         else
         {
            FashionService.ins.clothesSkill(0,_loc2_.id);
         }
         ArrayUtil.removeItem(_showingEffectIdArr,_loc2_.id);
      }
      
      private function onSkillUsingChange(param1:MzEvent) : void
      {
         this.list_skills.dataSource = _skillKindArr;
         showEffect(param1.data);
      }
      
      private function onChangeClick(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(param1 != -1)
         {
            if(param1 == 2 && FuncOpenAutoCtrl.checkOpen(30300) == false)
            {
               this.list_skills.selectedIndex = param2;
            }
            else if(param1 > 2)
            {
               this.list_skills.selectedIndex = param2;
            }
            else
            {
               _loc3_ = this.list_skills.y + this.list_skills.getCell(param1).y;
               TweenLite.to(this.img_selectBox,0.3,{
                  "y":_loc3_,
                  "ease":Back.easeOut
               });
               this.img_selectBox.visible = true;
               _tsms.toState(1);
               _skillSelectPanel.show(_skillKindArr[param1]);
               _needClearType.push(_skillKindArr[param1]);
            }
         }
      }
      
      private function onSelectClose(param1:Event) : void
      {
         _tsms.toState(2);
         this.list_skills.selectedIndex = -1;
         this.img_selectBox.visible = false;
      }
      
      private function showEffect(param1:int) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         var _loc4_:BmcSpriteSheet = new BmcSpriteSheet();
         if(_loc3_.kind == 1)
         {
            _loc5_ = this.list_skills.getCell(0) as SkillKindRender;
         }
         else if(HorseService.ins.allAuraList.indexOf(_loc3_.id) != -1)
         {
            _loc5_ = this.list_skills.getCell(2) as SkillKindRender;
         }
         else
         {
            _loc2_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",param1);
            if(_loc2_)
            {
               if(_loc2_.kind == 1)
               {
                  _loc5_ = this.list_skills.getCell(3) as SkillKindRender;
               }
               else
               {
                  _loc5_ = this.list_skills.getCell(4) as SkillKindRender;
               }
            }
            else
            {
               _loc5_ = this.list_skills.getCell(1) as SkillKindRender;
            }
         }
         _loc4_.x = -17;
         _loc4_.y = 10;
         _loc5_.addChild(_loc4_);
         _loc4_.init(1060);
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _needClearType;
         for each(var _loc1_ in _needClearType)
         {
            switch(int(_loc1_))
            {
               case 0:
                  SkillChangeModel.ins.newNorSkillVec = new Vector.<uint>();
                  continue;
               case 1:
                  SkillChangeModel.ins.newSpeSkillVec = new Vector.<uint>();
                  continue;
               case 2:
                  SkillChangeModel.ins.newAuraVec = new Vector.<uint>();
                  continue;
            }
         }
         super.dispose();
      }
   }
}
