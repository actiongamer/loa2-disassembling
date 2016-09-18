package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import morn.customs.MornExpandConsts2;
   import com.mz.core.inits.InitPublishFolder;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.VerListMgr;
   import com.mz.core.net.UrlLoaderTask;
   import com.mz.core.utils.MathUtil;
   
   public class InitClientConfigTask extends TaskBase
   {
       
      
      public function InitClientConfigTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         App.labelMed = new LabelMed();
         App.localeMgr = LocaleMgr.ins;
         MornExpandUtil.registerCustomComponents(MornExpandConsts2.customCompClassArr);
         MornExpandUtil.registerCustomComponents(MornExpandConsts2.customViewClassArr);
         MornExpandUtil.registerCustomComponents(MornExpandConsts2.customContainerClassArr);
         this.testOnParse();
      }
      
      private function testOnParse() : void
      {
         new InitPublishFolder(ClientConfig.publishPath);
         if(VerListMgr.ins.isInit)
         {
            this.onComplete();
         }
         else
         {
            new UrlLoaderTask(ClientConfig.publishPath + "ver_list.txt?v=" + MathUtil.random()).addCompleteHandler(ver_list_onCpl).exec();
         }
      }
      
      private function initVerList() : void
      {
         if(VerListMgr.ins.isInit)
         {
            this.onComplete();
         }
         else
         {
            new UrlLoaderTask(ClientConfig.publishPath + "ver_list.txt?v=" + MathUtil.random()).addCompleteHandler(ver_list_onCpl).exec();
         }
      }
      
      private function ver_list_onCpl(param1:UrlLoaderTask) : void
      {
         VerListMgr.ins.init(String(param1.loader.data));
         this.onComplete();
      }
   }
}
