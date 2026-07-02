Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EEB390CB2
	for <io-uring@vger.kernel.org>; Thu,  2 Jul 2026 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015615; cv=pass; b=n79MtKZ+62TIX3HhT5YEyhz4+WoW2LoyJECakt7GS458hTjjzm16MAXZ4RvsujifD7laUoclv/k2ZkhQI1DJZsijFHh5HVMULm72z1m8QlhHiCXgFAgw5ggzy9BKM6sZkwlJagcCET9wA6weP+t89VJSyPnnxYVnmmn6q3N/3+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015615; c=relaxed/simple;
	bh=xd1kWf+RV9y4OxHlO2An/c+8nijrnwvHGG9TpqbMqWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC1Mw5SL82qvCmsTD+d5h/1vRxdtsRNPCiipaXlE2oXFPkN9B9IPv5xE7oufTkiGcQ5PLQH+G4upNjmJFuSPtfe+XSK8GHYw2jQUjLjFxfmUAFhS++Gi81IXStYevk/98Zaypb8Qj7MkYtOu3JJqLTXIEU37x88dcIVbwclpXOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=GBrWKymN; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="GBrWKymN"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4960a66d36dso311021b6e.1
        for <io-uring@vger.kernel.org>; Thu, 02 Jul 2026 11:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783015613; cv=none;
        d=google.com; s=arc-20260327;
        b=J3ix/5f6oNAoiiWyvyVLWdM7m97sgrYogSKRR3gKHjcu7xgRRjDXFrFpXHAjk9uCGI
         5loMvAeFG8utxRnLDMW61n9ABMpPplcnAB06YLyzB6wuikQ8CakRFcPULuL7KwDOWH0T
         gAdhJpE2MV7Yot2+wJ4YXSL5+jf/NuhEmlIhpybfDRaIYS8HNvy+4BAkdsZXcaafpN1C
         qsQvfGeyMf/GbJM6UA9R4JKhMP0HbCmqE2oEd3n0wyWdso8hRSkrEdzlVUy/Tg+/l/om
         BhOyZ96ilBB8+MickwmsRuouunm9//uReCI4WVbWwdBFqA/pmko1Ts0sqmwhWaSxaN3R
         OSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xd1kWf+RV9y4OxHlO2An/c+8nijrnwvHGG9TpqbMqWA=;
        fh=ET7tUtBxL+tpLGDmcXNMcejM+wmU6a0x91nuX3ECRzY=;
        b=LeZrWsLkSdcv4yNiBdTyZRNOToGzo9SCyfK2EbAxRHxFVakKfgXq/G1wgHIqvDXLdH
         +Y8IypiPQ2Mfg2gkR0OoIsFCOwGf8fnb01y9JL6DZ63OcaQD471BpnWZnxh5h9Jg8cV3
         PkfUbxXl/dknyYAL6498bgDYag9uaFwFfIqXr/GFyLNJ7dXZZ9D04fvXq4XZI6P+lsA+
         NHOB5hwJiqENd/EgA5TEOHzXi19O2AwnB1894EiUvEnAZeSP4PwzFUtDArMXmBMXHtJs
         ERxgG/ghxzTZ7TrYTazi5GeoBFZe0cK5rib/0lDDc931+7VMapWEbLWJd1b+smxS2lZb
         UveA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1783015613; x=1783620413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xd1kWf+RV9y4OxHlO2An/c+8nijrnwvHGG9TpqbMqWA=;
        b=GBrWKymNHF1fdnP66gS2t5VZG7mjRZ43b15zH9PiITZdp8oBuZODvm7TcH5gThbtTK
         EZS2kZy0EycIktolr+PaleTCz0vlbVqf6XGzLdvVttXz9+7XVr6jjwIWk+CT7Wsylsh+
         N9nH0fVN4efCvGAhuNFaw3LnCHTUwUOM7iYUOVBOH0gtmAR5z2vdbAmBWJ3f1S74J2J4
         CNbKAilBbUljVrx1TqBpKIyJfodn1z4SR9b+ggJNm/aK22PumQXxfrGOIL7IUTOLiwrT
         UoIl3+pbC1QaSVu0CgocIlidk4XH1bSv38keRCCCqLkkYyQd7p/xt0SER9/wLRYKpGr+
         qdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015613; x=1783620413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xd1kWf+RV9y4OxHlO2An/c+8nijrnwvHGG9TpqbMqWA=;
        b=gjaLoER/OQHpH+fLKuKQcZsivdQ2kR9yHFDvrP6lu0Vk+CY2lJ6j1470oiG9/IUSXk
         IV7kMDLIggo3qm2xoexxJRq92f3CwWdRceNjhtXPjsQENk+YRMq6gGawjxuuCIMnZcZL
         aB1tJK6duOjo3wYMcvoyFA+hJCj6ijDPvw3YRcxZg54ilTT+8DgUGdsBjokt/jxb9v5n
         rG7M5rus90WVp1Fettv3tz0hS6xRCjYuiiRsyYMMlLOSpzvx5khm3oibvrKdtPQhLPMb
         McyKURyoi9eNrKz0DJ3OiX6L/mGhPkWc21N3s7LKCRRhI9p3tglGe2m36bH+MInOQ3Ft
         I3LQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/ro7RkjeEpmUQulrRMlXXbeMXq0x9ZS+TDJoW1fQJxZAQuahLkTk+ZS4fkDW31qQhL6U0zRSSxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfmDOE7A9MWt2zPIvP+vo78mtiVdEBQMoCx6hDTlhLfvaNoEsV
	QHDTYaKWGQ7J6N0hvj6aBZ+yiIBhDGCg5D9N0m6kTNdRNPOOdkuIPxOGYYE2pT3ipoVhUmtdQMx
	RZ9lk89RiSY/xx1PjunQC0lGSivX3j2a2DtE2hx8gIqTt9W02KW2gm1OsfQ==
X-Gm-Gg: AfdE7clnImKxRRoE5RPEeRv4XsmubSdM0mjpEu+9G6/bSUWjUzr1Mf8NoztMHVEUrZc
	SQPdoRTbMQ1ieGqnxvonUJI+pPhl998ke8ui5gURo21xErHbaTLpP1traXnnYakA2iM9t0xE+GJ
	aafSoG48LQhv4HxWYXcWyQNjeshfLHUFILgwAzLwGgYwwKBtfx+XprVtkgzvzdajHfzL484NvMp
	Kt31Td/r/T6OWNUxYQncltPqNXqI6uaE7NKnj1LvGLGaiolAyLDfvQeyAqah001udRU1/g5Eg==
X-Received: by 2002:a05:6808:15a5:b0:497:da5f:d5c3 with SMTP id
 5614622812f47-497da5fd8ffmr1139968b6e.6.1783015613140; Thu, 02 Jul 2026
 11:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
 <20260702082937.3707134-2-yangxiuwei@kylinos.cn> <CADUfDZqMpc5PCai9ZeUJQCJ++Cd3PszkDxyVu6WUMBKqwu1boQ@mail.gmail.com>
In-Reply-To: <CADUfDZqMpc5PCai9ZeUJQCJ++Cd3PszkDxyVu6WUMBKqwu1boQ@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 2 Jul 2026 11:06:41 -0700
X-Gm-Features: AVVi8CfoaEQUWrF1saee9h2s8brNIdC2B43LFvbW5Uq6A9Y7FOMoq4U4XHHQY9o
Message-ID: <CADUfDZp4DmCvwGyp9dJEEojSbkkcW8Bj9ZZEXVg3vw_7KsWhyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/uring_cmd: copy SQE before issue_blocking punt
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 10:43=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Thu, Jul 2, 2026 at 1:41=E2=80=AFAM Yang Xiuwei <yangxiuwei@kylinos.cn=
> wrote:
> >
> > io_uring_cmd_issue_blocking() punts to io-wq without copying the SQE
> > off the submission queue, unlike the -EAGAIN and fallback paths. Copy
> > the SQE into async data before queuing the work.
>
> Add a Fixes tag?
> Fixes: ecf47d452ced ("io_uring/uring_cmd: implement ->sqe_copy() to
> avoid unnecessary copies")

Actually I'm not convinced this is an issue at all. Since commit
212ec34e4e72 ("block: only read from sqe on initial invocation of
blkdev_uring_cmd()"), blkdev_uring_cmd() only accesses the SQE on the
initial issue. Even if the uring_cmd is re-issued asynchronously, it
doesn't rely on the SQE having been preserved.

Best,
Caleb
