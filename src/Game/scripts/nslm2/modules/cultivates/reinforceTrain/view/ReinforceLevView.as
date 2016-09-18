package nslm2.modules.cultivates.reinforceTrain.view
{
   import game.ui.reinforceTrain.ReinforceLevViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.reinforceTrain.ReinforceModel;
   import nslm2.modules.cultivates.roleTeam.view.panel.SelectYuanJunPanel;
   import nslm2.mgrs.stcMgrs.vos.StcSupportDevelopVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.reinforceTrain.render.ReinforceRender;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import flash.events.Event;
   import com.mz.core.logging.Log;
   import com.greensock.TweenLite;
   import nslm2.modules.roleInfos.equipPanels.MengYueEffectVo;
   import flash.text.TextFormat;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.cultivates.roleTeam.service.RoleTeamService;
   import nslm2.modules.cultivates.reinforceTrain.render.ReinforcePropRender;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class ReinforceLevView extends ReinforceLevViewUI implements IObserver
   {
       
      
      private var model:ReinforceModel;
      
      private var selectPanel:SelectYuanJunPanel;
      
      public var curVo:StcSupportDevelopVo;
      
      public var nextVo:StcSupportDevelopVo;
      
      private var lastForNext:Boolean = false;
      
      public function ReinforceLevView()
      {
         model = ReinforceModel.ins;
         super();
         this.list_hero.itemRender = ReinforceRender;
         this.list_propBase0.itemRender = ReinforcePropRender;
         this.list_propBase1.itemRender = ReinforcePropRender;
         this.img_bg0.skin = UrlLib.reinforceTrainUrl("img_bg0.png");
         this.img_bg1.skin = UrlLib.reinforceTrainUrl("img_bg1.png");
         this.txt_title.text = LocaleMgr.ins.getStr(30815004);
         this.txt_level0.text = LocaleMgr.ins.getStr(30815005);
         txt_level1.text = LocaleMgr.ins.getStr(30815012);
         ObserverMgr.ins.regObserver(this);
         init();
      }
      
      private function init(param1:Boolean = false) : void
      {
         if(model.supportReinDict.containsKey(1))
         {
            curVo = StcMgr.ins.getSupportDevelopVo(model.supportReinDict.getValue(1));
            if(curVo.level > 0)
            {
               nextVo = StcMgr.ins.getVoByMultiColumnValue("static_support_develop",["kind","level"],[1,curVo.level + 1]);
            }
            else
            {
               nextVo = StcMgr.ins.getVoByMultiColumnValue("static_support_develop",["kind","level"],[1,1]);
            }
         }
         else
         {
            curVo = StcMgr.ins.getSupportDevelopVo(1000);
            nextVo = StcMgr.ins.getVoByMultiColumnValue("static_support_develop",["kind","level"],[1,1]);
         }
         if(param1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30815007,[TextFieldUtil.linkHtmlText2(curVo.level,null,458496)]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(this.txt_tip0),1);
         }
         var _loc2_:Array = NpcPropVo.parseArrStr(curVo.attr,"+",null,0,false);
         if(param1)
         {
            _loc2_.forEach(setFloatPos);
         }
         else
         {
            refresh();
         }
         list_propBase0.dataSource = _loc2_;
         var _loc3_:Array = [];
         if(nextVo)
         {
            _loc3_ = NpcPropVo.parseArrStr(nextVo.attr,"+",null,0,false);
            list_propBase1.dataSource = _loc3_;
            list_propBase1.visible = true;
            txt_level1.visible = false;
         }
         else
         {
            list_propBase1.visible = false;
            txt_level1.visible = true;
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:Array = HeroModel.ins.YuanJunArr;
         this.list_hero.array = _loc1_;
         list_hero.useMouseDown = false;
         list_hero.changeHandler = listYuanJunSelectHandler;
         if(model.supportReinDict.containsKey(1))
         {
            if(curVo.level > 0)
            {
               txt_level0.visible = false;
               box_left.visible = true;
               txt_name0.text = LocaleMgr.ins.getStr(30815002,[curVo.level]);
               txt_tip0.text = LocaleMgr.ins.getStr(30815003,[curVo.condition_1]);
            }
            else
            {
               showLevel0();
            }
         }
         else
         {
            showLevel0();
         }
         if(nextVo)
         {
            txt_name1.text = LocaleMgr.ins.getStr(30815002,[nextVo.level]);
            txt_tip1.text = LocaleMgr.ins.getStr(30815003,[nextVo.condition_1]);
            txt_name1.visible = true;
            txt_tip1.visible = true;
         }
         else
         {
            txt_name1.visible = false;
            txt_tip1.visible = false;
         }
      }
      
      private function showLevel0() : void
      {
         txt_level0.visible = true;
         box_left.visible = false;
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
      }
      
      private function listYuanJunSelectHandler(param1:int) : void
      {
         var _loc3_:ReinforceRender = list_hero.selection as ReinforceRender;
         if(_loc3_.txt_openLvl.visible)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
            return;
         }
         var _loc2_:YuanJunVo = list_hero.selectedItem as YuanJunVo;
         RoleTeamModel.ins.selectedYuanJunPos = _loc2_.index;
         if(!_loc2_.heroData && _loc2_.isOpen)
         {
            showSelectYuanJunPanel();
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(122,_loc2_));
         }
      }
      
      private function showSelectYuanJunPanel() : void
      {
         if(!HeroModel.ins.getNotInYuanJunHeroList().length)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_LESS_ID)),30815);
            return;
         }
         if(HeroModel.ins.canSelectYuanjun() == false)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(10000022) + "\n" + LocaleMgr.ins.getStr(10000023),gotoSelectHero);
            return;
         }
         RoleTeamModel.ins.selectedYuanJunPos = (list_hero.selectedItem as YuanJunVo).index;
         if(this.selectPanel)
         {
            disposeSelectPanel();
         }
         else
         {
            disposeSelectPanel();
            selectPanel = new SelectYuanJunPanel();
            parent.parent.addChild(selectPanel);
            selectPanel.x = 238;
            selectPanel.y = 40;
            selectPanel.show();
            selectPanel.addEventListener("close",disposeSelectPanel);
            selectPanel.panelFadeIn();
         }
      }
      
      private function gotoSelectHero() : void
      {
         ModuleMgr.ins.showModule(30810,"show_shangzhen",ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function disposeSelectPanel(param1:Event = null) : void
      {
         if(selectPanel)
         {
            selectPanel.removeEventListener("close",disposeSelectPanel);
            selectPanel.panelFadeOutAndDispose();
            selectPanel = null;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["role_team_notice_select_new_yuanjun","role_team_notice_change_yuanjun","role_team_notice_show_mengyue_tip_yuanjun","role_team_show_select_yuanjun_panel","next_level_actived","float_cpl"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         Log.debug(param1);
         var _loc4_:* = param1;
         if("role_team_notice_select_new_yuanjun" !== _loc4_)
         {
            if("role_team_notice_change_yuanjun" !== _loc4_)
            {
               if("role_team_show_select_yuanjun_panel" !== _loc4_)
               {
                  if("role_team_notice_show_mengyue_tip_yuanjun" !== _loc4_)
                  {
                     if("next_level_actived" !== _loc4_)
                     {
                        if("float_cpl" === _loc4_)
                        {
                           refresh();
                        }
                     }
                     else
                     {
                        if(model.supportReinDict.containsKey(1))
                        {
                           _loc3_ = StcMgr.ins.getSupportDevelopVo(model.supportReinDict.getValue(1));
                        }
                        else
                        {
                           _loc3_ = StcMgr.ins.getSupportDevelopVo(1000);
                        }
                        if(_loc3_.level != curVo.level || lastForNext)
                        {
                           if(ModuleMgr.ins.popLayer.curModuleId == 30815)
                           {
                              TweenLite.delayedCall(0.2,initWithTween);
                              lastForNext = false;
                           }
                           else
                           {
                              lastForNext = true;
                           }
                        }
                        else
                        {
                           refresh();
                        }
                     }
                  }
                  else
                  {
                     showMengYueActivateTip(param2);
                  }
               }
               else
               {
                  showSelectYuanJunPanel();
               }
            }
            else
            {
               list_hero.dataSource = HeroModel.ins.YuanJunArr;
            }
         }
         else
         {
            selectNewHeroHandler(param2);
         }
      }
      
      private function initWithTween() : void
      {
         init(true);
      }
      
      private function showMengYueActivateTip(param1:Array) : void
      {
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc3_ = param1[_loc8_];
            _loc4_ = TextFieldUtil.htmlText(_loc3_.getHeroName(),new TextFormat(null,null,_loc3_.getHeroColor()));
            AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(30815013) + LocaleMgr.ins.getStr(30100011,[TextFieldUtil.htmlText(_loc3_.getMengYueName(),new TextFormat(null,null,16046112))]),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,80)),-1,null,null,1);
            _loc5_ = StcMgr.ins.getMengyueVo(_loc3_.mengYueId);
            _loc2_ = NpcPropVo.parseArrStr(_loc5_.attr,"+",null,0,false);
            var _loc11_:int = 0;
            var _loc10_:* = _loc2_;
            for each(var _loc7_ in _loc2_)
            {
               AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(30815013) + NPCPropConsts.ins.getLocaleNameNormal(_loc7_.propId) + "+" + NPCPropConsts.ins.showValue(_loc7_.value),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,80)),-1,null,null,1);
            }
            _loc8_++;
         }
      }
      
      private function selectNewHeroHandler(param1:UInt64) : void
      {
         RoleTeamModel.ins.selectedHeroId = param1;
         RoleTeamService.ins.changeYuanJun(RoleTeamModel.ins.selectedYuanJunPos,param1);
         disposeSelectPanel();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
