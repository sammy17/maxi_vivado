/*
 * Empty C++ Application
 */
#include "frame1.h"
#include <xfeature.h>
#include <xbacksub.h>
#include <xparameters.h>
#include <stdio.h>
#include <string.h>
#include <xtime_l.h>


#define TX_BASE_ADDR 0x11000000
#define RX_BASE_ADDR 0x12000000

#define M_AXI_BOUNDING 0x21000000
#define M_AXI_FEATUREH 0x29000000

uint32_t *m_buffer_TX = (uint32_t*) TX_BASE_ADDR;
uint8_t *m_test = (uint8_t*) TX_BASE_ADDR;
unsigned char *m_buffer_RX = (unsigned char*) RX_BASE_ADDR;

uint16_t * m_axi_bound = (uint16_t *) M_AXI_BOUNDING;
uint16_t * m_axi_feature = (uint16_t *) M_AXI_FEATUREH;


XBacksub backsub;
XFeature feature;

int main()
{
	XTime tStart, tEnd;

	XBacksub_Initialize(&backsub,XPAR_BACKSUB_0_DEVICE_ID);
	XFeature_Initialize(&feature,XPAR_FEATURE_0_DEVICE_ID);

	XTime_GetTime(&tStart); //Start measuring time

	// Checking backsub ip first

	XBacksub_Set_frame_in(&backsub,(u32)TX_BASE_ADDR);
	XBacksub_Set_frame_out(&backsub,(u32)RX_BASE_ADDR);
	XBacksub_Set_init(&backsub,true);

	memcpy(m_buffer_TX,frame1,sizeof(uint32_t)*76800/2);

	XBacksub_Start(&backsub);

	while(!XBacksub_IsDone(&backsub));

	printf("Backsub IP core is done\n");

	// checking feature IP core

	XFeature_Set_frame_in(&feature,(u32)TX_BASE_ADDR);
	XFeature_Set_bounding(&feature,(u32)M_AXI_BOUNDING);
	XFeature_Set_featureh(&feature,(u32)M_AXI_FEATUREH);

	// setting random bounding box coordinates for bounding

	m_axi_bound[0] = 64;
	m_axi_bound[1] = 64;
	m_axi_bound[2] = 128;
	m_axi_bound[3] = 128;

	XFeature_Start(&feature);

	while(!XFeature_IsDone(&feature));

	XTime_GetTime(&tEnd);
	printf("Feature IP Core is done\n");

	printf("Checking the output of backsub is correct...\n");

	for (int i=0;i<10;i++){
		printf("Expected : %d, Actual : %d\n",m_test[2*i],m_buffer_RX[i]);
	}

	printf("Check memory location 0x29000000 for histogram\n");


	printf("Output took %llu clock cycles.\n", 2*(tEnd - tStart));
	printf("Output took %.2f us.\n",1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));

	return 0;
}
