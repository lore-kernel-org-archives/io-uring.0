Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB46485CCB
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510896; cv=pass; b=MN6BrBnxYeu2ftmGQXlDxpSoRQRPNr7wX+hynMof4oQHprJ6V5LFcXXiqZurKORcrGhnaiLCB5nSzf4phtxhO4W+7xA8aVMtt24rhDeF6G7XMOBW0EQNi/4T/4lmdeC3XSCUnlLDHviNvhhhCYU8U0zmphDz17jhlk+rqAzImm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510896; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZWNvWeqATms0ktY3JyEQJji2eg/9+f+J0W2KtekoN0JmJwNT74Fv8IzMAhep00FVm9jSIWxbj4kZUNjLOAsrPXkaAI1cQyNGjY8r0b5D+OHUtcwz96BtGC8IGONPSF2vTlRiowykvZ9l3/lZFXFS+JleMl1/lXB6tQhUIdTHK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB07AtjI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB07AtjI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYntj619818
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 22:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2kj77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4574f1cac98so10163391fac.3
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=r/MQEKiHExVP8ZY4HFqp8XfCeFSHRdLgtkLzRJa+5/Ltz/OuLpdJfqNIQj2Ex8m84W
         eypabJT0AGXbJjn+i5Zdl8eTdWLpymqROkFjMMPmTvTICNOxybGIpYz3I4Jy9jdqoDQK
         jh4fyq5j11du3iiq2ikeNUSrNFDUiEnO1SqHNZPqlZgyYgPl4/joQDwRG8IpY9J7wxws
         z9oA/BLtdI9XE5og0CEh52ykY1iLRnit5+sB3pXGvoamC6v+cFqq7OccQAgKGAdbhOEw
         yHFF1yMxssZvLYt0N4O4DYBWMM8ONcDSzM0qDOz/RqKPViV78gzKrqJhkT7FdQajuJ1j
         K3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=KHZaza17Bfj1WKkN8DtMd6ejRDqPrAFMmIz16rHXnvA=;
        b=cz+emaonL5sj7/0XPfFlPKO51KIs2+wSM49XLmSSxjiObK7zM8Z2zSg4q3MWWd+A6c
         8tE4IMC/4e+lsQ7DAG4Ha/x+QhBrfchzFP4IaSnYg8p3Ssoea1PhuexuKTDjyORp141o
         JEJNSdYwu4FFjP+D7lKQ9gEUZV+TEkUn6w2NBoLV0kJcFeLb6JUBbjOKehsOWKHUn/Sk
         Z1vX6nfSPJ5BnZz87KrlLQR0w4LYRqTJ3DEPoeAXzpLCKqhN2DSt4JwaPpfYoJpoSCqp
         xgl7fV28DAaZejaWNNWGFi+TQ9JDqXPWPB21+Ih83BHyeXhemd+hc8JoWYBX8JB2i1wf
         6QmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=aB07AtjIKjPYRGcvBSuVUhbZlxd1+55zy/NhIuvnz19m7qssQTpE/4jhghs82a98Dx
         rtzGuCLITyYJpv6qqsfwRyWf2V/rvp/BavfnHKk+3jeYdHSZJCYDfk5x4efzm884vIfW
         UjGKSA8ySqC+bc1butY/HkkuCwEw+HH62Uipjk8j8bjqvTXRubAdUvP+c5BJvALTKQeE
         2MFV1Wjr7h5QJcQaotkuVTv077nzlClUSJUJjEEq6X2ukv02bdE+qejZx/+uCM7gRcPt
         xEQKVpHKyQ6abdYF/Q1vdcAj2ZFa315JGdv0g44dh8zUZEwY87qYbRStthdyfxwDukm3
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=taQO5kgtWQKNCmC8tJkbGtGbjV7DeLdtikyH0N2+6/MQRAvqQtMVCT8zq5+hHfkPos
         565UBOJpVuH2KD9ph4Qf1dcjb9DPF+LJPoDMCKkpC2Jf2+IQs069B1ZQlk5+0XOb2I50
         11DdF8U3ixrWQkdKF/GOch5aGbvilnZopXbM7qFltLg5BWwcU3RdstdtaNvRBg37dcPN
         iQvoG3H7ve4zs/QySOdGUhkw5t/fRwuedi4y2XYUAKZI9uZxaM60thMSZ1dlyyBj4TZb
         BPkS3vFXRVFVYfqrGpJkQjaNsmUNoJzaR5iZgy5HA9hOuOD6Vwm4ZAVtWwiJyEwsUuE+
         /q/A==
X-Forwarded-Encrypted: i=1; AKwUvBxdSKVlfM8bYUHiZqR9HdcrH+Lyod+Cw6fP9unXBW9mbwQAVfkoGjn5t73E4bw9Da9240uBxU/5Tg==@vger.kernel.org
X-Gm-Message-State: AFuF++l+NxtBs3x9XRUAyUEcXdbd16loZ5i+PlGk6J2HgCO9GqaSxbSA
	ijzJCOwBbG+LumpVoMxSpz6NxplZlZoVmHmAIL4J+Ee29i4n+Y4VWuterwm8mUwonD+Y126c7Op
	Bomb8g3//Y4pISJ65Nms36fl9b3pzboDldigw7/IKWvAG2wEciDOc5SS0EnwINOGn6d2oGwAQkM
	pZOvintMa14ahXdzkXFNIDSJrgy6S1OMnH/0GA
X-Gm-Gg: AYBFou12CFylWOTqD5c0E/gxMvYZzyf/o66fE9bd4SD2rcIfg1UWrCwWAYlKfTXWnQ5
	A7THksCTtegy46RLVvK6aV4V2riJ6+hlBi6Q568ERQv3xjvTEJEWEUi28TGb6OGhi6fw8DoPsq/
	HQsq2oTSI8e8k5fI5Jubmjk9TLQAjfsj6b9jh8DuWmDClYrUzzcx7LwPSr
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189751fac.2.1789510890845;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gNOZSpfTJJxsoqOroGec21bIurWt5vey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX8YZ8VIoGTBwf
 8k+pN4Rw2hIk+4806BqnM5kGvpr8BojMaAMT7LBH4H5DdMn3H2CgdzSzsquQYTe3zGEcyU+5ULE
 IADgnwZ1Os/fVMgnyPx6MpGTK//Xl/jDnOAhw6CXraJjma5cDwuhdVtjTrRlElx/mcbSeL9KXn2
 uP8IRnlwg3Hy2TnpgaYpMNCRlZjI/pBWY2ui8lMFHrB/ggfHEP1ZugCx3moZkeIsEh5aRqA54sU
 Z78AXvgHUIPwumx1FFxNIPlj6nkCneBrbTr3ei8vaWOgdihlYarygqvfSyGFwLnnX60p+yCioby
 e4+l021hEMQy3Y7kiOcoNW5z5DXWFL2pqH7jwojGYjB3lqHPc0/UZ2kQjIom7sxRIvSCmUlTPiR
 rHPjkzCGgCCIkHc3DaCX2ntRvyGihmD6XhWNADythfptKU8Qmsi1JEFTIozWPrA1FrmMKRDvrRN
 emcsZVElKYICDFChJ8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX/Fl1kfqPKW3C
 grWSXs97lOA+iWlWVu7VdzdhFktDEt0ZEEkvvMf4IczqtUT9M3KeuZTnCA2XtOUCdWFgltyADsZ
 1HykXvjDkpVeAonlGXKAhpXbANdDrqU=
X-Proofpoint-GUID: gNOZSpfTJJxsoqOroGec21bIurWt5vey
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
