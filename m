Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616DF375AD0
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241899; cv=pass; b=mSlph9XAuzG2G98/K3K6zL/UB4VlDgxvqaYY0Boo2vVJWFcWDeNAb7176bdQH0Inlojq6H1Jr7ds+7tMawCD3rO/LjUQv/IzlSBw9dvSGK9pvNB+62+vvMf5NRa1XsKIg7EvP7T5KRpire7+eZQAmSsncxyeUlNZ86xyx580oe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241899; c=relaxed/simple;
	bh=ScjXOqQImwnq/+GSOja67enbwGlUvPiqbtO40lGxh+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2OPOGibsFVLPfxYO+Jv/I45p2/EzC/KAECghptyHCVyu9J5vCV1jcAsdoelLcnY4Sc4HD1hh8A2I6lg8dDMat8PQ80drWgE2iah7ounRVQOojhlPeOIRF3QSehfIrV83O5UIz4sEazojLBu/Q1rdfD4pFvaTAg28JlmoDd1Cp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UmGCdqiI; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UmGCdqiI"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6f4728b8dso92870a34.3
        for <io-uring@vger.kernel.org>; Thu, 11 Jun 2026 22:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781241896; cv=none;
        d=google.com; s=arc-20240605;
        b=Jov14qoqj3w29YkvOQ1dxt2A2JP9kle2tSY6LrwcHe67DqgKsw5hITN237ua5mNJXt
         sRB/KEDaZ6So0EoLDDNiPycxeUV7E45LGGRXcWPOoKBC6j0o8WfkxIEWBN9vMMGRf7pa
         BcXlg3Hv+b3iN7I2+gmhU8XVz+cK6Wz7jf4NAvvplEdTbJxA2c3ftSEnon6FlVH9a9bb
         VDae8xNJwY6GhZVfmwxy3lLxVhOkYxKIjxT3Vh0tSjPg6GlqOMUbLz0zDuLC3m4FkYa1
         XZkwmaoYtsNYuihSzwS3iZU7Iy8GgPrcwdVAtvN4YadPGw4fX2jSD9IZ14/5EhzNeYI3
         I78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGf0beZLFi4NalkX/LApDcqdAnXaP8Hdtt88N+zdzVk=;
        fh=8SanVj4MV0LZcXSROTGCY35wrAI3fk+fJGDl/3jrlWo=;
        b=TmCE7VUcWeAB1REbre6JAzqH4fmF7xXESllyWSHjjMp5g1OKwRzSczzn3y02sd6H5z
         s/72HxukygY9pNFXLIuWNDvdfeTz6vrEuOL9ZTfgCqpVGS6K4UT196/w7Ye1XyctIBKV
         kBrK8MabubNDwmh2wfsg+EbfXmERzpkycQwGGWXecqXs1S9xBHHsm65SZqXWxVtKx5ja
         zylStkzHqIDkmjzrzs6GwFWH9gcn7XEnh1T1fzenuAcxdQpYAZyamKRZyDJ6Er8EMr7S
         AUQfy1Y1esiEhDSXTqy/Xq7Xpw29pb9VE3RcahNKJYWK1qUyTQcjs8l8ydycpy3Wop+X
         zIyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1781241896; x=1781846696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGf0beZLFi4NalkX/LApDcqdAnXaP8Hdtt88N+zdzVk=;
        b=UmGCdqiIKP6hG7OY9Pis3h45ItDpapfqvG3IOZT1o2nSiS8CycEtngQVURZQEhlVUH
         UrN/yk/SjPgrClKkrKOMTpMGU9GGJeqHEfdXjrkp9j2TxUx4IL9JkbJwVdYlSBfD4l+q
         Md4CM1QljTK5ahXHbOv0gAd+1g8y7UlcjnCa9MfJLdvJ29VeeQWWZs2eC1nef+5Hq+30
         t+kfrCEySPk5JlKGwecmuOcQszsZIPtSZiQ83+E4bisRhCDuaimE0/EPmBFeXIC+m85K
         CPcwh1PvqL3weHGrizjp/W1ytMpQxX+cTijLmUhkfj1VZq2BwLICE7L149Xlk9uMMzjT
         8aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781241896; x=1781846696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGf0beZLFi4NalkX/LApDcqdAnXaP8Hdtt88N+zdzVk=;
        b=kT7VFoY0MmkyG6FWOMSUzQxDcIWIXj7HpWiPJwZQ9At+m71WGG5VchsEz4M+Oi55e2
         A4u0mETAlzabTLd9WdQySc+7lrxEGK5F+/UIM2PnM0b3WfE9g7BsRtLUPCEM9CT8CluU
         sVoX7Z6OEX/tYCCbVA61IZswEsbl/Sth+yFOvxD7ComwkX6Vsl+kVwYGeLG2OVQb4Xsi
         TU0Oe/N2FFek21vzhC0X4wWgN9/4g/pEvzeHkmCfwUvQ7W4aPLiV9WtZPZf9SuIsrz4s
         6Bjewpxu5s0KfJ0LrIQ7J0JMKQumbzV5jQOI5cIgNkVq8W6eQmQYZ5upANLD4h2VBLq+
         OGBw==
X-Gm-Message-State: AOJu0YzL+hqfNdEPgtGDZW2dvuOH9W2Noj7fehMsgp/JcuBB9/mbO0/Z
	/vPoHXXeMwLtVzco6tU2ak9z/pg8BrYh6hymc6h7eZDKlnPmDVUBMzj4F5NZbDAF7EPACYWrFWI
	oAuTh7JDTzUM9U0XlEzHNptokn8IlgD9rznXog02y/AuQL/LvOYO02nRpsA==
X-Gm-Gg: Acq92OG7ZszF2YjlsO6pKj4QcQT7fMUO+ARiQA8RId/oXRZeeVOOrugFb+oIRPZtoQC
	AFj3UtrXocHXveoaybszdbSKG9EjUFvCI3oAVnDL4bUIVA5mU0CrotXXQUogqGw2gJw9idinvnc
	pTwqHZUMGh+RPM3CBN2wmKfn8PbjXcwdJ3OQNpZeiArwcE1/fLztcAIzU+5SObeiDsRHjkw8D8r
	QsG1UC4todeq0UUUZvOTTlONlmTnt2mK6uLlpZDLFFMkv5af6zInn3g+jTuT8ZB/RWJjGjJmkHR
	WNZ8SZwb
X-Received: by 2002:a05:6808:1920:b0:486:39db:ebf1 with SMTP id
 5614622812f47-4872f57225emr493470b6e.7.1781241896078; Thu, 11 Jun 2026
 22:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611160553.1486640-1-axboe@kernel.dk> <20260611160553.1486640-3-axboe@kernel.dk>
 <CADUfDZrzwvY6UpBBhLj1JynuNf5bo140+LbMYDOvU13=od+nkQ@mail.gmail.com> <4be7a6db-44bc-4125-867e-9d22c2809f1c@kernel.dk>
In-Reply-To: <4be7a6db-44bc-4125-867e-9d22c2809f1c@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 11 Jun 2026 22:24:45 -0700
X-Gm-Features: AVVi8CcTE3uXpOGxtrRgC-DuBdGgxx4ywfU4JQaYnBV9F03XEqNCZ3_MlbIPpRw
Message-ID: <CADUfDZr-MMYBaP-e+y9+xuRhuiunO2sBTUCmwZyd7AgT8sVtiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] io_uring: switch local task_work to a mpscq
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 7:23=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 6/11/26 7:14 PM, Caleb Sander Mateos wrote:
> > This is great stuff! I had also observed these hotspots on a ublk
> > workload. Since incoming ublk requests post task work to the ublk
> > server's io_urings and completed ublk requests post task work to the
> > client's io_urings, there is significant cross-CPU contention on the
> > task work queues.
>
> Glad you like it! Once I post v2 tomorrow, perhaps you can try and run
> some tests with and without and see how it does for you?

Haven't tested v2 yet, but v1 shows a 4% IOPS improvement on a ublk
4-KB read workload. The workload has 8 CPUs (unpaired hypertwins)
running fio with io_uring submitting I/O to the ublk devices and 32
ublk server CPUs (paired hypertwins) servicing the requests, achieving
around 4M IOPS. Both the client and server CPUs look completely busy.
I can see clear reductions in __io_req_task_work_add() and
llist_reverse_order() (now gone) on both sets of CPUs, through the
cache misses popping task work items are now attributed to
__io_run_local_work() instead.

Thanks,
Caleb

>
> >> @@ -185,55 +183,47 @@ void io_req_local_work_add(struct io_kiocb *req,=
 unsigned flags)
> >>
> >>         guard(rcu)();
> >
> > Is the RCU guard still required now that a work list element can't be
> > accessed after the consumer has popped it?
>
> It's actually not. Might need the :
>
>         if (prev =3D=3D &ctx->work_list.stub) {
>                 io_ctx_mark_taskrun(ctx);
>
> parts to just grab it in there, as lower down we'd still need it. But
> the task_work part itself should not. I'll make that change.
>
> Thanks for the reviews!
>
> --
> Jens Axboe
