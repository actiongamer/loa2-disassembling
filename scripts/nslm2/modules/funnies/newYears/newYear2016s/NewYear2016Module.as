package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016ModuleUI;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.common.ctrls.TSMDict;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ctrls.TSM;
   import com.mz.core.utils.DisplayUtils;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NewYear2016Module extends NewYear2016ModuleUI
   {
      
      public static const RENDER_WIDTH:int = 256;
      
      public static const TSM_STATE_INDEX:int = 0;
      
      public static const TSM_STATE_1:int = 1;
      
      public static const TSM_STATE_2:int = 2;
      
      public static const TSM_STATE_3:int = 3;
       
      
      private var renders:Vector.<nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render>;
      
      private var tsms:TSMDict;
      
      public var vs:ViewStack;
      
      private var curFuncId:int;
      
      public function NewYear2016Module()
      {
         renders = new Vector.<nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render>();
         tsms = new TSMDict();
         super();
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(this.service.isOpenTimeOne() == false)
         {
            AlertUtil.floadFuncTimeIsExpire(this.moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         this.service.init(service_loginInfoHandler);
      }
      
      private function service_loginInfoHandler() : void
      {
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         this.moduleFadeInType = 2;
         this.boxRender.mask = this.mask_render;
         renders.push(this.render0UI as nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render);
         renders.push(this.render1UI as nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render);
         renders.push(this.render2UI as nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render);
         var _loc2_:int = renders.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = renders[_loc4_];
            _loc3_.buttonMode = true;
            _loc3_.dataSource = _loc4_ + 1;
            _loc3_.addEventListener("click",render_onClick);
            _loc4_++;
         }
         tsms.put(render0UI,new TSM(this.render0UI,0.4).addState(0,{}).addState(1,{
            "visible":true,
            "x":0
         }).addState(2,{
            "visible":false,
            "x":-256
         }).copyState(3,2));
         tsms.put(render1UI,new TSM(this.render1UI,0.4).addState(0,{}).addState(1,{
            "visible":false,
            "x":788
         }).addState(2,{
            "visible":true,
            "x":0
         }).addState(3,{
            "visible":false,
            "x":-256
         }));
         tsms.put(render2UI,new TSM(this.render2UI,0.4).addState(0,{}).addState(1,{
            "visible":false,
            "x":788
         }).addState(2,{
            "visible":false,
            "x":788
         }).addState(3,{
            "visible":true,
            "x":0
         }));
         vs = new ViewStack();
         vs.subViewClasses = [NewYear2016_DailyPanel,NewYear2016_BossPanel,NewYear2016_GodPanel];
         DisplayUtils.addChildBelow(vs,this.boxRender);
         vs.x = this.boxRender.x + 256;
         vs.y = this.boxRender.y;
         this.btn_close.clickHandler = btn_clickHandler;
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
      
      private function render_onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(curFuncId == 0)
         {
            _loc2_ = this.renders.indexOf(param1.currentTarget as nslm2.modules.funnies.newYears.newYear2016s.NewYear2016Render);
            switch(int(_loc2_))
            {
               case 0:
                  _loc3_ = 13311;
                  break;
               case 1:
                  _loc3_ = 13312;
                  break;
               case 2:
                  _loc3_ = 13313;
            }
            if(NpcFuncService.ins.isOpenTime(_loc3_))
            {
               if(_loc3_ == 13313 && this.service.welcomeGodInfoRes == null)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(13310016));
               }
               else
               {
                  curFuncId = _loc3_;
                  tsms.toState(_loc2_ + 1);
                  vs.selectedIndex = _loc2_;
               }
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(13310016));
            }
         }
         else
         {
            curFuncId = 0;
            tsms.toState(0);
         }
      }
      
      private function btn_clickHandler() : void
      {
         if(tsms.curStateAll != 0)
         {
            curFuncId = 0;
            tsms.toState(0);
         }
         else
         {
            this.btnCloseHandler();
         }
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = renders.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = renders[_loc3_];
            _loc2_.removeEventListener("click",render_onClick);
            _loc3_++;
         }
         renders.length = 0;
         tsms.clear();
         super.dispose();
      }
   }
}
