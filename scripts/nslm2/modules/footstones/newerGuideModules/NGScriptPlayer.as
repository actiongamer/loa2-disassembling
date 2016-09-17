package nslm2.modules.footstones.newerGuideModules
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import flash.events.MouseEvent;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.components.comp2d.BlackRim;
   import nslm2.modules.dungeons.scripts.ScriptLib;
   import nslm2.modules.dungeons.scripts.ScriptRunner;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.configs.ClientConfig;
   
   public class NGScriptPlayer implements IObserver, IDispose
   {
       
      
      public var scriptBox:IScriptBox;
      
      private var cover:BlackRim;
      
      private var scriptLib:ScriptLib;
      
      private var scriptCtrl:ScriptRunner;
      
      public function NGScriptPlayer(param1:IScriptBox)
      {
         cover = new BlackRim();
         super();
         this.scriptBox = param1;
         ObserverMgr.ins.regObserver(this);
         cover.width = ClientConfig.SCENE_FIXED_W;
         cover.height = ClientConfig.SCENE_FIXED_H;
         cover.hole = null;
         cover.fileColor = 16711680;
         cover.fileAlpha = 0;
         cover.draw();
         cover.addEventListener("click",cover_onClick);
      }
      
      private function cover_onClick(param1:MouseEvent) : void
      {
         if(param1.altKey && param1.ctrlKey)
         {
            DisplayUtils.removeSelf(cover);
         }
      }
      
      private function playerNgScript(param1:int) : void
      {
         scriptBox.topLayer2D.addChild(cover);
         if(scriptLib)
         {
            scriptLib.dispose();
            scriptLib = null;
         }
         if(scriptCtrl)
         {
            scriptCtrl.dispose();
            scriptCtrl = null;
         }
         if(EnvConfig.ins.showScript)
         {
            scriptLib = new ScriptLib(param1,UrlLib.cityScript(param1));
         }
         else
         {
            scriptLib = new ScriptLib(0,null);
         }
         scriptLib.addCompleteHandler(this.scriptLib_loadCpl).exec();
      }
      
      private function scriptLib_loadCpl() : void
      {
         var _loc1_:Array = scriptLib.getScript("city");
         if(_loc1_ && _loc1_.length && (_loc1_[0] as Array).length)
         {
            scriptCtrl = new ScriptRunner(this.scriptBox,_loc1_);
            scriptCtrl.addCompleteHandler(script_onCpl).exec();
         }
         else
         {
            this.script_onCpl();
         }
      }
      
      private function script_onCpl() : void
      {
         DisplayUtils.removeSelf(cover);
         ObserverMgr.ins.sendNotice("msg_ng_script_cpl",this.scriptLib.scriptId);
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_script_city","msg_ng_script"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_script_city" !== _loc3_)
         {
            if("msg_ng_script" === _loc3_)
            {
               playerNgScript(int(param2));
            }
         }
         else
         {
            playerNgScript(int(param2));
         }
      }
      
      public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         if(scriptLib)
         {
            scriptLib.dispose();
            scriptLib = null;
         }
         if(scriptCtrl)
         {
            scriptCtrl.dispose();
            scriptCtrl = null;
         }
      }
   }
}
