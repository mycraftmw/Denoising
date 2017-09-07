/*
 * MATLAB Compiler: 6.2 (R2016a)
 * Date: Thu May 04 21:58:27 2017
 * Arguments: "-B" "macro_default" "-W" "java:NoiseRemover,NoiseRemover" "-T" "link:lib" 
 * "-d" "D:\\code\\repository\\Denoising\\code2\\NoiseRemover\\for_testing" 
 * "class{NoiseRemover:D:\\code\\repository\\Denoising\\code2\\PA.m,D:\\code\\repository\\Denoising\\code2\\RemovalNoise.m}" 
 */

package NoiseRemover;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class NoiseRemoverMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "NoiseRemover_AD64DAB2FD2276BE20FFF8105F47A93C";
    
    /** Component name */
    private static final String sComponentName = "NoiseRemover";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(NoiseRemoverMCRFactory.class)
        );
    
    
    private NoiseRemoverMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            NoiseRemoverMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,0,1}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
