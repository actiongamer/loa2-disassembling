package nslm2.modules.funnies.teamGuajiScenes.changeChallenges
{
   import game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeModuleUI;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import game.ui.teamGuajiScenes.changeChallenges.GuajiChangeChallengeRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.GuajiInfoRes;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class GuajiChangeChallengeModule extends GuajiChangeChallengeModuleUI
   {
       
      
      private var crtFloorId:int;
      
      public function GuajiChangeChallengeModule()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41210030);
      }
      
      public function get service() : TeamGuajiService
      {
         return TeamGuajiService.ins;
      }
      
      private function setRenderListItems() : void
      {
         setRenderStyle(this.item0);
         setRenderStyle(this.item1);
         setRenderStyle(this.item2);
         setRenderStyle(this.item3);
         setRenderStyle(this.item4);
         setRenderStyle(this.item5);
         setRenderStyle(this.item6);
         setRenderStyle(this.item7);
         setRenderStyle(this.item8);
      }
      
      private function setRenderStyle(param1:GuajiChangeChallengeRenderUI) : void
      {
         var _loc2_:* = param1;
         if(this.item0 !== _loc2_)
         {
            if(this.item1 !== _loc2_)
            {
               if(this.item2 !== _loc2_)
               {
                  if(this.item3 !== _loc2_)
                  {
                     if(this.item4 !== _loc2_)
                     {
                        if(this.item5 !== _loc2_)
                        {
                           if(this.item6 !== _loc2_)
                           {
                              if(this.item7 !== _loc2_)
                              {
                                 if(this.item8 === _loc2_)
                                 {
                                    this.item8.txt_name.text = LocaleMgr.ins.getStr(41210908);
                                    this.item8.txt_name.style = "渐变紫";
                                    if(108 <= service.sceneInfo.maxPassedGuajiId + 1)
                                    {
                                       this.item8.img_icon.disabled = false;
                                       this.item8.txt_lock.visible = false;
                                    }
                                    else
                                    {
                                       this.item8.img_icon.disabled = true;
                                       this.item8.txt_lock.visible = true;
                                    }
                                 }
                              }
                              else
                              {
                                 this.item7.txt_name.text = LocaleMgr.ins.getStr(41210907);
                                 this.item7.txt_name.style = "渐变紫";
                                 if(107 <= service.sceneInfo.maxPassedGuajiId + 1)
                                 {
                                    this.item7.img_icon.disabled = false;
                                    this.item7.txt_lock.visible = false;
                                 }
                                 else
                                 {
                                    this.item7.img_icon.disabled = true;
                                    this.item7.txt_lock.visible = true;
                                 }
                              }
                           }
                           else
                           {
                              this.item6.txt_name.text = LocaleMgr.ins.getStr(41210906);
                              this.item6.txt_name.style = "渐变紫";
                              if(106 <= service.sceneInfo.maxPassedGuajiId + 1)
                              {
                                 this.item6.img_icon.disabled = false;
                                 this.item6.txt_lock.visible = false;
                              }
                              else
                              {
                                 this.item6.img_icon.disabled = true;
                                 this.item6.txt_lock.visible = true;
                              }
                           }
                        }
                        else
                        {
                           this.item5.txt_name.text = LocaleMgr.ins.getStr(41210905);
                           this.item5.txt_name.style = "渐变蓝";
                           if(105 <= service.sceneInfo.maxPassedGuajiId + 1)
                           {
                              this.item5.img_icon.disabled = false;
                              this.item5.txt_lock.visible = false;
                           }
                           else
                           {
                              this.item5.img_icon.disabled = true;
                              this.item5.txt_lock.visible = true;
                           }
                        }
                     }
                     else
                     {
                        this.item4.txt_name.text = LocaleMgr.ins.getStr(41210904);
                        this.item4.txt_name.style = "渐变蓝";
                        if(104 <= service.sceneInfo.maxPassedGuajiId + 1)
                        {
                           this.item4.img_icon.disabled = false;
                           this.item4.txt_lock.visible = false;
                        }
                        else
                        {
                           this.item4.img_icon.disabled = true;
                           this.item4.txt_lock.visible = true;
                        }
                     }
                  }
                  else
                  {
                     this.item3.txt_name.text = LocaleMgr.ins.getStr(41210903);
                     this.item3.txt_name.style = "渐变蓝";
                     if(103 <= service.sceneInfo.maxPassedGuajiId + 1)
                     {
                        this.item3.img_icon.disabled = false;
                        this.item3.txt_lock.visible = false;
                     }
                     else
                     {
                        this.item3.img_icon.disabled = true;
                        this.item3.txt_lock.visible = true;
                     }
                  }
               }
               else
               {
                  this.item2.txt_name.text = LocaleMgr.ins.getStr(41210902);
                  this.item2.txt_name.style = "渐变绿";
                  if(102 <= service.sceneInfo.maxPassedGuajiId + 1)
                  {
                     this.item2.img_icon.disabled = false;
                     this.item2.txt_lock.visible = false;
                  }
                  else
                  {
                     this.item2.img_icon.disabled = true;
                     this.item2.txt_lock.visible = true;
                  }
               }
            }
            else
            {
               this.item1.txt_name.text = LocaleMgr.ins.getStr(41210901);
               this.item1.txt_name.style = "渐变绿";
               if(101 <= service.sceneInfo.maxPassedGuajiId + 1)
               {
                  this.item1.img_icon.disabled = false;
                  this.item1.txt_lock.visible = false;
               }
               else
               {
                  this.item1.img_icon.disabled = true;
                  this.item1.txt_lock.visible = true;
               }
            }
         }
         else
         {
            this.item0.txt_name.text = LocaleMgr.ins.getStr(41210900);
            this.item0.txt_name.style = "渐变绿";
            this.item0.txt_lock.visible = false;
         }
         param1.addEventListener("click",onClick);
         param1.addEventListener("mouseDown",onMouseDown);
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:GuajiChangeChallengeRender = param1.currentTarget as GuajiChangeChallengeRender;
         var _loc4_:StcGuajiVo = _loc2_.dataSource as StcGuajiVo;
         var _loc3_:StcGuajiVo = StcMgr.ins.getGuajiVo(TeamGuajiService.ins.sceneInfo.curGuajiId);
         if(_loc2_.txt_lock.visible)
         {
            if(_loc4_.id > service.sceneInfo.curGuajiId || service.sceneInfo.curGuajiId == 99)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(41210612));
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(999000458),new Handler(goToKillBoss,[StcMgr.ins.getNpcGroupVo(_loc3_.boss_group_id).display_npc]));
            }
         }
         else
         {
            list_icons.selection = _loc2_;
         }
         param1.stopImmediatePropagation();
      }
      
      private function goToKillBoss(param1:int) : void
      {
         ObserverMgr.ins.sendNotice("KILL_BOSS",param1);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.list_icons.dataSource = StcMgr.ins.getGuajiTable().array;
         setRenderListItems();
         TeamGuajiService.ins.server_get_guajiInfo(get_guajiInfo_cpl);
         this.list_icons.selectedIndex = getSelectedIndex(service.sceneInfo.curGuajiId);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.panelBg.bgCustom.addChild(this.img_bg);
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId);
      }
      
      private function get_guajiInfo_cpl(param1:GuajiInfoRes) : void
      {
         crtFloorId = param1.curGuajiId;
         this.list_icons.selectedIndex = getSelectedIndex(param1.curGuajiId);
      }
      
      private function getSelectedIndex(param1:int) : int
      {
         switch(int(param1) - 100)
         {
            case 0:
               return 0;
            case 1:
               return 1;
            case 2:
               return 2;
            case 3:
               return 3;
            case 4:
               return 4;
            case 5:
               return 5;
            case 6:
               return 6;
            case 7:
               return 7;
            case 8:
               return 8;
         }
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if(this.btn_enter === _loc4_)
         {
            _loc3_ = getGuajiId(list_icons.selectedIndex);
            if(crtFloorId != _loc3_)
            {
               service.server_set_guajiNandu(set_guajiNandu_cpl,getGuajiId(list_icons.selectedIndex));
            }
            else
            {
               ModuleMgr.ins.closeModule(41211);
            }
         }
      }
      
      private function getGuajiId(param1:int) : int
      {
         switch(int(param1))
         {
            case 0:
               return 100;
            case 1:
               return 101;
            case 2:
               return 102;
            case 3:
               return 103;
            case 4:
               return 104;
            case 5:
               return 105;
            case 6:
               return 106;
            case 7:
               return 107;
            case 8:
               return 108;
         }
      }
      
      private function set_guajiNandu_cpl() : void
      {
         ModuleMgr.ins.closeModule(41211);
      }
   }
}
