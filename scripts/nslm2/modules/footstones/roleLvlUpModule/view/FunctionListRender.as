package nslm2.modules.footstones.roleLvlUpModule.view
{
   import game.ui.lvlUpModules.FunctionListRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.common.model.HeroModel;
   import com.mz.core.mediators.RollMediator;
   
   public class FunctionListRender extends FunctionListRenderUI
   {
       
      
      private var _data:StcFunctionVo;
      
      public function FunctionListRender()
      {
         super();
         this.addEventListener("click",openModule);
         this.img_selected.alpha = 0;
         this.parts.push(new RollMediator(this,rollHander));
      }
      
      public function get stcFunctionVo() : StcFunctionVo
      {
         return _data;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         btn_go.visible = false;
         _data = param1 as StcFunctionVo;
         var _loc2_:int = PlayerModel.ins.level;
         txt_name.text = _data.descString;
         txt_des.text = LocaleMgr.ins.getStr(_data.total_desc);
         img_iocn.skin = UrlLib.funcOpenIcon(_data.id);
         if(_data.level == PlayerModel.ins.level)
         {
            img_open.visible = true;
         }
         else
         {
            img_open.visible = false;
         }
         if(_data.level <= _loc2_)
         {
            txt_needLvl.text = "";
         }
         else
         {
            txt_needLvl.text = LocaleMgr.ins.getStr(999000090,[_data.level]);
         }
      }
      
      private function openModule(param1:MouseEvent = null) : void
      {
         var _loc3_:* = null;
         if(btn_go.visible == false)
         {
            return;
         }
         var _loc2_:int = PlayerModel.ins.level;
         var _loc4_:* = _data.id;
         if(41400 !== _loc4_)
         {
            if(13001 !== _loc4_)
            {
               if(30110 !== _loc4_)
               {
                  if(20010 !== _loc4_)
                  {
                     if(30109 !== _loc4_)
                     {
                        if(30608 !== _loc4_)
                        {
                           if(30607 !== _loc4_)
                           {
                              if(30814 !== _loc4_)
                              {
                                 if(30501 !== _loc4_)
                                 {
                                    ModuleMgr.ins.showModule(_data.id);
                                 }
                                 else
                                 {
                                    ModuleMgr.ins.showModule(30500,{"tabIndex":1});
                                 }
                              }
                              else
                              {
                                 ModuleMgr.ins.showModule(30810);
                              }
                           }
                           else
                           {
                              ModuleMgr.ins.showModule(30600,{"tabIndex":1});
                           }
                        }
                        else
                        {
                           ModuleMgr.ins.showModule(30600,{"tabIndex":2});
                        }
                     }
                  }
                  addr36:
                  ModuleMgr.ins.closeModule(10150);
                  _loc3_ = new RoleInfoModuleParam();
                  _loc3_.init(HeroModel.ins.playerHero,_data.id);
                  ModuleMgr.ins.showModule(30100,_loc3_,30701);
               }
               §§goto(addr36);
            }
            else
            {
               ModuleMgr.ins.showModule(13000);
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(10150);
            NpcFuncRef.ins.execHandler(41400);
         }
      }
      
      private function rollHander(param1:Boolean) : void
      {
         this.img_selected.alpha = !!param1?1:0;
      }
   }
}
