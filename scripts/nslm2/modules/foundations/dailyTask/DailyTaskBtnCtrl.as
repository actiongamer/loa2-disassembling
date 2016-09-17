package nslm2.modules.foundations.dailyTask
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.mains.BuyGuajiEnergy;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuaJiParam;
   
   public class DailyTaskBtnCtrl
   {
       
      
      public function DailyTaskBtnCtrl()
      {
         super();
      }
      
      public static function openTargetModuel(param1:int, param2:int = 0) : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = param1;
         if(1 !== _loc9_)
         {
            if(2 !== _loc9_)
            {
               if(8 !== _loc9_)
               {
                  if(9 !== _loc9_)
                  {
                     if(10 !== _loc9_)
                     {
                        if(4 !== _loc9_)
                        {
                           if(5004 !== _loc9_)
                           {
                              if(5 !== _loc9_)
                              {
                                 if(6 !== _loc9_)
                                 {
                                    if(7 !== _loc9_)
                                    {
                                       if(28 !== _loc9_)
                                       {
                                          if(11 !== _loc9_)
                                          {
                                             if(12 !== _loc9_)
                                             {
                                                if(13 !== _loc9_)
                                                {
                                                   if(14 !== _loc9_)
                                                   {
                                                      if(15 !== _loc9_)
                                                      {
                                                         if(17 !== _loc9_)
                                                         {
                                                            if(18 !== _loc9_)
                                                            {
                                                               if(107 !== _loc9_)
                                                               {
                                                                  if(5001 !== _loc9_)
                                                                  {
                                                                     if(5006 !== _loc9_)
                                                                     {
                                                                        if(16 !== _loc9_)
                                                                        {
                                                                           if(20 !== _loc9_)
                                                                           {
                                                                              if(21 !== _loc9_)
                                                                              {
                                                                                 if(22 !== _loc9_)
                                                                                 {
                                                                                    if(23 !== _loc9_)
                                                                                    {
                                                                                       if(24 !== _loc9_)
                                                                                       {
                                                                                          if(25 !== _loc9_)
                                                                                          {
                                                                                             if(26 !== _loc9_)
                                                                                             {
                                                                                                if(29 !== _loc9_)
                                                                                                {
                                                                                                   if(37 !== _loc9_)
                                                                                                   {
                                                                                                      if(48 !== _loc9_)
                                                                                                      {
                                                                                                         if(49 !== _loc9_)
                                                                                                         {
                                                                                                            if(50 !== _loc9_)
                                                                                                            {
                                                                                                               if(51 !== _loc9_)
                                                                                                               {
                                                                                                                  if(104 !== _loc9_)
                                                                                                                  {
                                                                                                                     if(106 !== _loc9_)
                                                                                                                     {
                                                                                                                        if(114 !== _loc9_)
                                                                                                                        {
                                                                                                                           if(5000 !== _loc9_)
                                                                                                                           {
                                                                                                                              if(19 !== _loc9_)
                                                                                                                              {
                                                                                                                                 if(111 !== _loc9_)
                                                                                                                                 {
                                                                                                                                    if(109 !== _loc9_)
                                                                                                                                    {
                                                                                                                                       if(110 !== _loc9_)
                                                                                                                                       {
                                                                                                                                          if(113 !== _loc9_)
                                                                                                                                          {
                                                                                                                                             if(5002 !== _loc9_)
                                                                                                                                             {
                                                                                                                                                if(5003 !== _loc9_)
                                                                                                                                                {
                                                                                                                                                   if(5006 !== _loc9_)
                                                                                                                                                   {
                                                                                                                                                      if(108 !== _loc9_)
                                                                                                                                                      {
                                                                                                                                                         if(105 !== _loc9_)
                                                                                                                                                         {
                                                                                                                                                            if(1017 !== _loc9_)
                                                                                                                                                            {
                                                                                                                                                               if(55 !== _loc9_)
                                                                                                                                                               {
                                                                                                                                                                  if(59 === _loc9_)
                                                                                                                                                                  {
                                                                                                                                                                     if(FuncOpenAutoCtrl.checkOpen(50700))
                                                                                                                                                                     {
                                                                                                                                                                        ModuleMgr.ins.showModule(50700);
                                                                                                                                                                     }
                                                                                                                                                                     else
                                                                                                                                                                     {
                                                                                                                                                                        AlertUtil.float("等级不足，系统未开放");
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                               }
                                                                                                                                                               else if(FuncOpenAutoCtrl.checkOpen(30121))
                                                                                                                                                               {
                                                                                                                                                                  ModuleMgr.ins.showModule(30121,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                                                               }
                                                                                                                                                               else
                                                                                                                                                               {
                                                                                                                                                                  AlertUtil.float("等级不足，系统未开放");
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                         }
                                                                                                                                                         if(FuncOpenAutoCtrl.checkOpen(41210))
                                                                                                                                                         {
                                                                                                                                                            _loc5_ = new TeamGuaJiParam();
                                                                                                                                                            _loc5_.showRobPanel = true;
                                                                                                                                                            ModuleMgr.ins.showModule(41210,_loc5_);
                                                                                                                                                         }
                                                                                                                                                         else
                                                                                                                                                         {
                                                                                                                                                            AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                                                         }
                                                                                                                                                      }
                                                                                                                                                      else if(FuncOpenAutoCtrl.checkOpen(30500))
                                                                                                                                                      {
                                                                                                                                                         ModuleMgr.ins.showModule(30500,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                         AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   else if(FuncOpenAutoCtrl.checkOpen(30600))
                                                                                                                                                   {
                                                                                                                                                      ModuleMgr.ins.showModule(30600,{"tabIndex":1},ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                                                   }
                                                                                                                                                   else
                                                                                                                                                   {
                                                                                                                                                      AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                             }
                                                                                                                                             addr547:
                                                                                                                                             if(FuncOpenAutoCtrl.checkOpen(30600))
                                                                                                                                             {
                                                                                                                                                ModuleMgr.ins.showModule(30600,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                                             }
                                                                                                                                             else
                                                                                                                                             {
                                                                                                                                                AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                                             }
                                                                                                                                          }
                                                                                                                                          §§goto(addr547);
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    if(FuncOpenAutoCtrl.checkOpen(30500))
                                                                                                                                    {
                                                                                                                                       ModuleMgr.ins.showModule(30500,{"tabIndex":1},ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                       AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              if(FuncOpenAutoCtrl.checkOpen(30109))
                                                                                                                              {
                                                                                                                                 _loc7_ = new RoleInfoModuleParam();
                                                                                                                                 _loc7_.init(HeroModel.ins.playerHero,30109);
                                                                                                                                 ModuleMgr.ins.showModule(30100,_loc7_,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                 AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                              }
                                                                                                                           }
                                                                                                                        }
                                                                                                                        addr455:
                                                                                                                        if(FuncOpenAutoCtrl.checkOpen(30110))
                                                                                                                        {
                                                                                                                           _loc8_ = new RoleInfoModuleParam();
                                                                                                                           _loc8_.init(HeroModel.ins.playerHero,30110);
                                                                                                                           ModuleMgr.ins.showModule(30100,_loc8_,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                           AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                        }
                                                                                                                     }
                                                                                                                     §§goto(addr455);
                                                                                                                  }
                                                                                                                  else if(FuncOpenAutoCtrl.checkOpen(50200))
                                                                                                                  {
                                                                                                                     ModuleMgr.ins.showModule(50200);
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                                  }
                                                                                                               }
                                                                                                               else if(FuncOpenAutoCtrl.checkOpen(60530))
                                                                                                               {
                                                                                                                  ModuleMgr.ins.showModule(60530,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                               }
                                                                                                            }
                                                                                                            else if(FuncOpenAutoCtrl.checkOpen(60530))
                                                                                                            {
                                                                                                               ModuleMgr.ins.showModule(60530,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                            }
                                                                                                         }
                                                                                                         else if(FuncOpenAutoCtrl.checkOpen(41400))
                                                                                                         {
                                                                                                            ModuleMgr.ins.closeModule(13000);
                                                                                                            NpcFuncRef.ins.execHandler(41400);
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         AlertUtil.comfirm(new BuyGuajiEnergy());
                                                                                                      }
                                                                                                   }
                                                                                                   else if(FuncOpenAutoCtrl.checkOpen(41500))
                                                                                                   {
                                                                                                      ModuleMgr.ins.showModule(41500);
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                   }
                                                                                                }
                                                                                                else if(FuncOpenAutoCtrl.checkOpen(30300))
                                                                                                {
                                                                                                   ModuleMgr.ins.showModule(30300,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                                }
                                                                                             }
                                                                                             else if(FuncOpenAutoCtrl.checkOpen(40408))
                                                                                             {
                                                                                                ChapterModel.ins.chapterType = 2;
                                                                                                ModuleMgr.ins.showModule(40400);
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                             }
                                                                                          }
                                                                                          else if(FuncOpenAutoCtrl.checkOpen(41500))
                                                                                          {
                                                                                             ModuleMgr.ins.showModule(41500);
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          AlertUtil.lackStamina(false);
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       ModuleMgr.ins.showModule(10621,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    ModuleMgr.ins.showModule(60310,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                                 }
                                                                              }
                                                                              else if(FuncOpenAutoCtrl.checkOpen(41210))
                                                                              {
                                                                                 ModuleMgr.ins.showModule(41210);
                                                                              }
                                                                              else
                                                                              {
                                                                                 AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                              }
                                                                           }
                                                                           else if(FuncOpenAutoCtrl.checkOpen(30600))
                                                                           {
                                                                              ModuleMgr.ins.showModule(30600,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                           }
                                                                           else
                                                                           {
                                                                              AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                           }
                                                                        }
                                                                        else if(FuncOpenAutoCtrl.checkOpen(41500))
                                                                        {
                                                                           ModuleMgr.ins.showModule(41500,null,ModuleMgr.ins.popLayer.curModuleId);
                                                                        }
                                                                        else
                                                                        {
                                                                           AlertUtil.float(LocaleMgr.ins.getStr(999000230));
                                                                        }
                                                                     }
                                                                  }
                                                                  addr189:
                                                                  ModuleMgr.ins.showModule(30810,null,ModuleMgr.ins.popLayer.curModuleId);
                                                               }
                                                               addr188:
                                                               §§goto(addr189);
                                                            }
                                                            addr187:
                                                            §§goto(addr188);
                                                         }
                                                         addr186:
                                                         §§goto(addr187);
                                                      }
                                                      addr185:
                                                      §§goto(addr186);
                                                   }
                                                   §§goto(addr185);
                                                }
                                                else
                                                {
                                                   ModuleMgr.ins.closeModule(13000);
                                                   NpcFuncRef.ins.execHandler(41400);
                                                }
                                             }
                                             else
                                             {
                                                ModuleMgr.ins.showModule(60310,null,null);
                                             }
                                          }
                                          else
                                          {
                                             ModuleMgr.ins.closeModule(13000);
                                             ModuleMgr.ins.showModule(50200);
                                          }
                                       }
                                    }
                                    addr145:
                                    ModuleMgr.ins.closeModule(13000);
                                    ObserverMgr.ins.sendNotice("task_notice_go_loterry");
                                 }
                                 §§goto(addr145);
                              }
                              else
                              {
                                 ModuleMgr.ins.showModule(30500,{"tabIndex":1},ModuleMgr.ins.popLayer.curModuleId);
                              }
                           }
                        }
                        ModuleMgr.ins.showModule(30500,{"tabIndex":0},ModuleMgr.ins.popLayer.curModuleId);
                     }
                     addr830:
                     return;
                  }
                  addr21:
                  _loc6_ = StcMgr.ins.getChapterVo(param2);
                  if(_loc6_)
                  {
                     _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc6_.id,1]);
                  }
                  if(!param2 || PlayerModel.ins.level >= int(_loc3_.unlock_level))
                  {
                     if(_loc6_ != null && _loc6_.kind == 2)
                     {
                        ChapterModel.ins.chapterType = 2;
                     }
                     else
                     {
                        ChapterModel.ins.chapterType = 1;
                     }
                     ChapterModel.ins.lastOpenChapterId = param2;
                     ModuleMgr.ins.closeModule(13000);
                     _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_stage_npc_relation",["stage_id","mount_func"],[SceneModel.ins.sceneId,40400]);
                     ObserverMgr.ins.sendNotice("task_notice_auto_track",!!_loc4_?_loc4_.id:100);
                  }
                  else
                  {
                     AlertUtil.lackLevel(_loc3_.unlock_level);
                  }
                  §§goto(addr830);
               }
               addr20:
               §§goto(addr21);
            }
            addr19:
            §§goto(addr20);
         }
         §§goto(addr19);
      }
      
      public static function checkIsYueKaTask(param1:int) : Boolean
      {
         return [50,51].indexOf(param1) >= 0;
      }
   }
}
