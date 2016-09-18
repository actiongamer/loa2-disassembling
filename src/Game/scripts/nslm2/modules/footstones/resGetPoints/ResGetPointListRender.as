package nslm2.modules.footstones.resGetPoints
{
   import game.ui.resGetPoints.ResGetPointListRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.RestrictiveConditionUtils;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import nslm2.modules.foundations.guildModule.vo.GuildParamVo;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.modules.foundations.mall.vo.MallParamVo;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuaJiParam;
   import nslm2.types.FunctionType;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   
   public class ResGetPointListRender extends ResGetPointListRenderUI
   {
       
      
      public function ResGetPointListRender()
      {
         super();
         this.btn_enter.clickHandler = btn_handler;
      }
      
      public function get itemVo() : ResGetPointListItem
      {
         return dataSource as ResGetPointListItem;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         .super.dataSource = param1;
         if(itemVo)
         {
            this.img_icon.skin = UrlLib.moduleIconForGetPoint(itemVo.funcId);
            this.txt_name.text = LocaleMgr.ins.getStr(itemVo.name);
            if(ClientConfig.isChineseLang() == false)
            {
               txt_desc.size = 10;
               txt_desc.leading = 0;
            }
            var _loc5_:* = itemVo.funcId;
            if(40408 !== _loc5_)
            {
               if(40400 !== _loc5_)
               {
                  if(30121 !== _loc5_)
                  {
                     this.txt_desc.text = LocaleMgr.ins.getStr(itemVo.desc);
                     this.btn_enter.disabled = false;
                     this.btn_enter.label = LocaleMgr.ins.getStr(999000132);
                  }
                  else
                  {
                     _loc4_ = StcMgr.ins.getConstellationVo(int(itemVo.paraId));
                     if(_loc4_)
                     {
                        this.txt_desc.text = LocaleMgr.ins.getStr(itemVo.desc,[LocaleMgr.ins.getStr(StcMgr.ins.getConstellationPageVo(_loc4_.map_id).name),LocaleMgr.ins.getStr(_loc4_.name)]);
                        _loc3_ = HeroAwakenRoadModel.ins.checkCanFight(_loc4_.id);
                        if(_loc3_)
                        {
                           this.btn_enter.disabled = false;
                           this.btn_enter.label = LocaleMgr.ins.getStr(999000132);
                        }
                        else
                        {
                           this.btn_enter.disabled = true;
                           this.btn_enter.label = LocaleMgr.ins.getStr(999000133);
                        }
                     }
                     else
                     {
                        this.txt_desc.text = LocaleMgr.ins.getStr(itemVo.desc);
                     }
                  }
               }
            }
            _loc2_ = StcMgr.ins.getStageVo(int(itemVo.paraId));
            if(_loc2_)
            {
               this.txt_desc.text = LocaleMgr.ins.getStr(itemVo.desc,[LocaleMgr.ins.getStr(StcMgr.ins.getChapterVo(_loc2_.chapter_id).name),LocaleMgr.ins.getStr(_loc2_.name)]);
               if(ChapterModel.ins.canEnterStage(_loc2_.id,false,false) == true)
               {
                  this.btn_enter.disabled = false;
                  this.btn_enter.label = LocaleMgr.ins.getStr(999000130);
               }
               else
               {
                  this.btn_enter.disabled = true;
                  this.btn_enter.label = LocaleMgr.ins.getStr(999000131);
               }
            }
            else
            {
               this.txt_desc.text = LocaleMgr.ins.getStr(itemVo.desc);
            }
         }
      }
      
      private function btn_handler() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc1_:* = null;
         _loc4_ = null;
         var _loc6_:* = itemVo.funcId;
         if(13001 !== _loc6_)
         {
            if(11300 !== _loc6_)
            {
               if(40408 !== _loc6_)
               {
                  if(40400 !== _loc6_)
                  {
                     if(20010 !== _loc6_)
                     {
                        if(11900 !== _loc6_)
                        {
                           if(41400 !== _loc6_)
                           {
                              if(50240 !== _loc6_)
                              {
                                 if(11306 !== _loc6_)
                                 {
                                    if(41224 !== _loc6_)
                                    {
                                       if(40714 !== _loc6_)
                                       {
                                          if(50504 !== _loc6_)
                                          {
                                             if(50702 !== _loc6_)
                                             {
                                                if(30124 !== _loc6_)
                                                {
                                                   if(40703 !== _loc6_)
                                                   {
                                                      if(11200 !== _loc6_)
                                                      {
                                                         if(41219 !== _loc6_)
                                                         {
                                                            if(30121 !== _loc6_)
                                                            {
                                                               if(30610 !== _loc6_)
                                                               {
                                                                  if(11308 !== _loc6_)
                                                                  {
                                                                     if(FunctionType.ALL_SHOP_ARR.indexOf(itemVo.funcId) != -1)
                                                                     {
                                                                        if(!FuncOpenAutoCtrl.checkOpen(itemVo.funcId))
                                                                        {
                                                                           AlertUtil.FloatfuncNotOpen();
                                                                           return;
                                                                        }
                                                                        if(StringUtils.isNull(itemVo.paraId))
                                                                        {
                                                                           ModuleMgr.ins.closeModule(12101);
                                                                           ModuleMgr.ins.showModule(60300,new ShopOpenVo(itemVo.funcId),ModuleMgr.ins.popLayer.curModuleId);
                                                                        }
                                                                        else
                                                                        {
                                                                           _loc4_ = StcMgr.ins.getShopVo(int(itemVo.paraId));
                                                                           if(_loc4_)
                                                                           {
                                                                              if(RestrictiveConditionUtils.condSatisfied(_loc4_.condi) && ShopModel.ins.getCanBuyMaxCount(_loc4_.id) > 0 && _loc4_.limit_num == 0)
                                                                              {
                                                                                 ModuleMgr.ins.showModule(60320,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
                                                                              }
                                                                              else
                                                                              {
                                                                                 ModuleMgr.ins.closeModule(12101);
                                                                                 ModuleMgr.ins.showModule(60300,new ShopOpenVo(itemVo.funcId,int(itemVo.paraId)),ModuleMgr.ins.popLayer.curModuleId);
                                                                              }
                                                                           }
                                                                        }
                                                                     }
                                                                     else if(FunctionType.MYSTERY_SHOP_ARR.indexOf(itemVo.funcId) != -1)
                                                                     {
                                                                        if(!FuncOpenAutoCtrl.checkOpen(itemVo.funcId))
                                                                        {
                                                                           AlertUtil.FloatfuncNotOpen();
                                                                           return;
                                                                        }
                                                                        ModuleMgr.ins.closeModule(12101);
                                                                        ModuleMgr.ins.showModule(60310,itemVo.funcId,ModuleMgr.ins.popLayer.curModuleId);
                                                                     }
                                                                     else if(FuncOpenAutoCtrl.checkOpen(itemVo.funcId))
                                                                     {
                                                                        ModuleMgr.ins.closeModule(12101);
                                                                        if(!ModuleMgr.ins.isShow(itemVo.funcId))
                                                                        {
                                                                           ModuleMgr.ins.showModule(itemVo.funcId,null,itemVo.funcId == 60200?0:ModuleMgr.ins.popLayer.curModuleId);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        AlertUtil.FloatfuncNotOpen();
                                                                     }
                                                                  }
                                                                  else if(FuncOpenAutoCtrl.checkOpen(11308))
                                                                  {
                                                                     ModuleMgr.ins.closeModule(11300);
                                                                     if(!ModuleMgr.ins.isShow(30610))
                                                                     {
                                                                        ModuleMgr.ins.showModule(11300,5,ModuleMgr.ins.popLayer.curModuleId);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     AlertUtil.FloatfuncNotOpen();
                                                                  }
                                                               }
                                                               else if(FuncOpenAutoCtrl.checkOpen(30610))
                                                               {
                                                                  ModuleMgr.ins.closeModule(12101);
                                                                  if(!ModuleMgr.ins.isShow(30610))
                                                                  {
                                                                     ModuleMgr.ins.showModule(30610,int(itemVo.paraId),ModuleMgr.ins.popLayer.curModuleId);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  AlertUtil.FloatfuncNotOpen();
                                                               }
                                                            }
                                                            else
                                                            {
                                                               jumpToHeroAwakenRoad(itemVo);
                                                            }
                                                         }
                                                         else if(!ModuleMgr.ins.isShow(41210))
                                                         {
                                                            _loc1_ = new TeamGuaJiParam();
                                                            _loc1_.showRobPanel = true;
                                                            ModuleMgr.ins.showModule(41210,_loc1_);
                                                         }
                                                         else
                                                         {
                                                            ModuleMgr.ins.showModule(41219);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc3_ = itemVo.paraId.split(":");
                                                         if(_loc3_[0] == 3 && _loc3_[1] > 0)
                                                         {
                                                            _loc5_ = new MallItemVo();
                                                            _loc2_ = StcMgr.ins.getMallItemVo(_loc3_[1]);
                                                            if(_loc2_)
                                                            {
                                                               _loc5_.id = _loc2_.id;
                                                               _loc5_.stcMallItemVo = _loc2_;
                                                               ModuleMgr.ins.showModule(11201,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
                                                            }
                                                            else
                                                            {
                                                               ModuleMgr.ins.showModule(11200,new MallParamVo(_loc3_[0],_loc3_[1]),ModuleMgr.ins.popLayer.curModuleId);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            ModuleMgr.ins.showModule(11200,new MallParamVo(_loc3_[0],_loc3_[1]),ModuleMgr.ins.popLayer.curModuleId);
                                                         }
                                                      }
                                                   }
                                                   else if(ModuleMgr.ins.isShow(40700))
                                                   {
                                                      ModuleMgr.ins.showModule(40700);
                                                      ObserverMgr.ins.sendNotice("guild_notice_show_guild_donate_panel");
                                                   }
                                                   else
                                                   {
                                                      ModuleMgr.ins.showModule(40700,new GuildParamVo(40703));
                                                   }
                                                }
                                             }
                                             addr131:
                                             if(StringUtils.isNull(itemVo.paraId))
                                             {
                                                ModuleMgr.ins.closeModule(12101);
                                                ModuleMgr.ins.showModule(60300,new ShopOpenVo(itemVo.funcId),ModuleMgr.ins.popLayer.curModuleId);
                                             }
                                             else
                                             {
                                                _loc4_ = StcMgr.ins.getShopVo(int(itemVo.paraId));
                                                if(_loc4_)
                                                {
                                                   if(RestrictiveConditionUtils.condSatisfied(_loc4_.condi) && ShopModel.ins.getCanBuyMaxCount(_loc4_.id) > 0 && _loc4_.limit_num == 0)
                                                   {
                                                      ModuleMgr.ins.showModule(60320,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
                                                   }
                                                   else
                                                   {
                                                      ModuleMgr.ins.closeModule(12101);
                                                      ModuleMgr.ins.showModule(60300,new ShopOpenVo(itemVo.funcId,int(itemVo.paraId)),ModuleMgr.ins.popLayer.curModuleId);
                                                   }
                                                }
                                             }
                                          }
                                          addr130:
                                          §§goto(addr131);
                                       }
                                       addr129:
                                       §§goto(addr130);
                                    }
                                    addr128:
                                    §§goto(addr129);
                                 }
                                 addr127:
                                 §§goto(addr128);
                              }
                              §§goto(addr127);
                           }
                           else
                           {
                              if(ModuleMgr.ins.sceneLayer.curModuleId != 40500)
                              {
                                 AlertUtil.float(LocaleMgr.ins.getStr(999000134));
                                 return;
                              }
                              NpcFuncRef.ins.execHandler(41400);
                           }
                        }
                        else
                        {
                           if(ModuleMgr.ins.sceneLayer.curModuleId != 40500)
                           {
                              AlertUtil.float(LocaleMgr.ins.getStr(999000134));
                              return;
                           }
                           ModuleMgr.ins.closeModule(12101);
                           ObserverMgr.ins.sendNotice("task_notice_go_loterry");
                        }
                     }
                     else
                     {
                        ModuleMgr.ins.closeModule(12101);
                        RoleInfoModel.ins.showRoleInfoModule(20010);
                     }
                  }
                  else
                  {
                     jumpToChapterModule(itemVo);
                  }
               }
               else if(FuncOpenAutoCtrl.checkOpen(40408) == false)
               {
                  AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(40408));
               }
               else
               {
                  jumpToChapterModule(itemVo);
               }
            }
            else
            {
               ModuleMgr.ins.closeModule(12101);
               if(!ModuleMgr.ins.isShow(11300))
               {
                  ModuleMgr.ins.showModule(itemVo.funcId,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
         }
         else if(FuncOpenAutoCtrl.checkOpen(13001))
         {
            ModuleMgr.ins.showModule(13000);
         }
         else
         {
            AlertUtil.FloatfuncNotOpen();
         }
      }
      
      private function jumpToChapterModule(param1:ResGetPointListItem) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = itemVo.paraId;
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(_loc5_);
         if(_loc2_)
         {
            _loc4_ = StcMgr.ins.getChapterVo(_loc2_.chapter_id);
            if((ChapterModel.ins.cplIdArrDic.getValue(_loc4_.kind).indexOf(_loc5_) != -1 || ChapterModel.ins.nextStageIdDic.getValue(_loc4_.kind) == _loc5_) && _loc2_.kind != 1)
            {
               _loc3_ = new ChapterModuleInitVo(_loc2_.chapter_id,_loc5_,true);
               GlobalRef.chapterModuleShowAgainVo = null;
               ModuleMgr.ins.closeModule(12101);
               ModuleMgr.ins.showModule(40400,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000135));
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(12101);
            ModuleMgr.ins.showModule(40400,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function jumpToHeroAwakenRoad(param1:ResGetPointListItem) : void
      {
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc6_:int = itemVo.paraId;
         var _loc2_:StcConstellationVo = StcMgr.ins.getConstellationVo(_loc6_);
         if(_loc2_)
         {
            _loc5_ = StcMgr.ins.getConstellationPageVo(_loc2_.map_id);
            _loc3_ = HeroAwakenRoadModel.ins.checkCanFight(_loc6_);
            if(_loc3_)
            {
               _loc4_ = new ChapterModuleInitVo(_loc5_.id,_loc6_,true);
               ModuleMgr.ins.closeModule(12101);
               ModuleMgr.ins.showModule(30121,_loc4_,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000136));
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(12101);
            ModuleMgr.ins.showModule(30121,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}
